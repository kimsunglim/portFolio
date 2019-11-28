package com.kopo.thecute;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// 메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		// 세션 체크후 로그인중이면 메인페이지로 이동 아니면 로그인페이지로 이동
		try { 
			String id = (String)session.getAttribute("user_id");		
			if (id != null) {
				return "main";
			}
		} catch (NullPointerException e) {
			return "login";
		}
		return "login";
	}
	
	// 아이디 중복 체크
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET, produces = "application/json")
	// json 사용할때는 필수?!
	@ResponseBody
	public int idCheck(Locale locale, Model model, @RequestParam(value="userId", required=false) String userid) {
		DBCommon dbCommon = new DBCommon();
		System.out.println(userid);
	    // 입력받은 id를 가지고 THECUTE_USER 테이블을 조회
		int check = dbCommon.searchData(new User(), userid);
		System.out.println(check);
		return check;
	}
	
	// 회원가입 페이지
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		return "join";
	}
	
	// 회원가입 처리
	@RequestMapping(value = "/do_join", method = RequestMethod.POST)
	public String doJoin(Locale locale, Model model, HttpServletRequest request) {
		MessageDigest md;
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String name = request.getParameter("name");
		
		// select box에서 입력받은 생년월일 합치기
		String birthday = year + month + day;
		
		// 비밀번호 암호화
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(password.getBytes());
			StringBuilder sb = new StringBuilder();
			for (byte b : md.digest()) {
				sb.append(Integer.toString((b & 0xff) + 0x100, 16).substring(1));
			}
			password = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		// THECUTE_USER 테이블에 입력받은 회원정보 insert
		DBCommon dbCommon = new DBCommon();
		dbCommon.insertUserData(new User(id, password, birthday, name));
		model.addAttribute("message", "가입되었습니다.");
		
		return "done";	
	}	
	
	// 로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		// 세션 체크후 로그인중이면 메인페이지로 이동 아니면 로그인페이지로 이동
		try { 
			String id = (String)session.getAttribute("user_id");		
			if (id != null) {
				return "redirect:/";
			}
		} catch (NullPointerException e) {
			return "login";
		}
		return "login";
	}
	
	// 로그인 처리
	@RequestMapping(value = "/do_login", method = RequestMethod.POST)
	public String doLogin(Locale locale, Model model, HttpServletRequest request, @RequestParam("id") String id, @RequestParam("password") String password) {
		DBCommon dbCommon = new DBCommon();
		MessageDigest md;
		
		// 비밀번호 암호화
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(password.getBytes());
			StringBuilder sb = new StringBuilder();
			for (byte b : md.digest()) {
				sb.append(Integer.toString((b & 0xff) + 0x100, 16).substring(1));
			}
			password = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		// 입력받은 아이디 비밀번호로 THECUTE_USER 테이블에 회원 데이터가 있는지 체크후 아이디를 리턴
		String userId = dbCommon.signIn(id, password);
		System.out.println(userId);
		
		// 리턴받은 아이디 value가 있으면 세션에 저장후 메인페이지로 이동 null값이면 로그인 페이지로 이동
		if (userId != null) {
			HttpSession session = request.getSession();

			session.setAttribute("user_id", userId);
			return "redirect:/";
		}
		return "redirect:/login";
	}
	
	// 로그아웃 처리
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Locale locale, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		// 세션정보를 삭제후 메인페이지로 이동
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 설문조사 페이지
	@RequestMapping(value = "/research", method = RequestMethod.GET)
	public String research(Locale locale, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		// 세션 체크후 로그인중이면 설문조사 페이지로 이동 아니면 로그인 페이지로 이동
		try { 
			String id = (String)session.getAttribute("user_id");	
			if (id != null) {
				return "research";
			}
		} catch (NullPointerException e) {
			return "redirect:/login";
		}
		return "redirect:/login";
	}
	
	// 어디로갈까? 페이지
	@RequestMapping(value = "/selectData", method = RequestMethod.GET)
	public String selectData(Locale locale, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		// 세션 체크후 로그인중이면 어디로갈까? 페이지로 이동 아니면 로그인페이지로 이동
		try { 
			String id = (String)session.getAttribute("user_id");	
			if (id != null) {
				return "selectData";
			}
		} catch (NullPointerException e) {
			return "redirect:/login";
		}	
		return "redirect:/login";
	}
	
	// 파라미터를 입력받아서 구글차트 처리
	@RequestMapping(value = "/showChart", method = RequestMethod.GET)
	public String showChart(Locale locale, Model model, HttpServletRequest request, 
			@RequestParam(value="jobgroup", required=false) String jobgroup, 
			@RequestParam(value="q010000", required=false) String q010000, 
			@RequestParam(value="q07grade", required=false) String q07grade) {
		HttpSession session = request.getSession();
		
		// 세션 체크후 로그인중이면 입력받은 파라미터를 가지고 THECUTE에 쿼리 날리고 아니면 로그인페이지로 이동
		try {
			String id = (String)session.getAttribute("user_id");
			if (id != null) {
				DBCommon dbCommon = new DBCommon();
				HashMap<String, String> selectData = dbCommon.detailsData(new Q0606(), jobgroup, q010000, q07grade);
				HashMap<String, String> selectData2 = dbCommon.detailsData(new Q0601(), jobgroup, q010000, q07grade);
		//		System.out.println(selectData);
				
				// 입력한 파라미터 값 select에 설정
				model.addAttribute("jobgroup_" + jobgroup, "selected");
				model.addAttribute("q010000_"  + q010000, "selected");
				model.addAttribute("q07grade_"  + q07grade, "selected");
				
				// 파라미터값으로 group by한 여행지에서의 활동, 여행지 정보를 저장
				model.addAllAttributes(selectData);
				model.addAllAttributes(selectData2);
		
				return "selectData";
			}
		} catch (NullPointerException e) {
			return "redirect:/login";
		}
		return "redirect:/login";
	}
	
	// 설문조사 처리
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(Locale locale, Model model, HttpServletRequest request, 
			@RequestParam(value="age", required=false) String age, @RequestParam(value="sex", required=false) String sex, @RequestParam(value="sido", required=false) String sido, 
			@RequestParam(value="jobgroup", required=false) String jobgroup, @RequestParam(value="month", required=false) String month, 
			@RequestParam(value="q010000", required=false) String q010000, @RequestParam(value="q020000", required=false) String q020000, @RequestParam(value="q040100", required=false) String q040100, @RequestParam(value="q040200", required=false) String q040200, 
			@RequestParam(value="q040300", required=false) String q040300, @RequestParam(value="q040400", required=false) String q040400, @RequestParam(value="q040500", required=false) String q040500, @RequestParam(value="q040600", required=false) String q040600, 
			@RequestParam(value="q040700", required=false) String q040700, @RequestParam(value="q040800", required=false) String q040800, @RequestParam(value="q040900", required=false) String q040900, @RequestParam(value="q041000", required=false) String q041000, 
			@RequestParam(value="q041100", required=false) String q041100, @RequestParam(value="q050000", required=false) String q050000, @RequestParam(value="q060101", required=false) String q060101, @RequestParam(value="q060102", required=false) String q060102, 
			@RequestParam(value="q060103", required=false) String q060103, @RequestParam(value="q060104", required=false) String q060104, @RequestParam(value="q060105", required=false) String q060105, @RequestParam(value="q060106", required=false) String q060106, 
			@RequestParam(value="q060107", required=false) String q060107, @RequestParam(value="q060108", required=false) String q060108, @RequestParam(value="q060109", required=false) String q060109, @RequestParam(value="q060110", required=false) String q060110, 
			@RequestParam(value="q060111", required=false) String q060111, @RequestParam(value="q060112", required=false) String q060112, @RequestParam(value="q060113", required=false) String q060113, @RequestParam(value="q060114", required=false) String q060114, 
			@RequestParam(value="q060115", required=false) String q060115, @RequestParam(value="q060116", required=false) String q060116, @RequestParam(value="q060301", required=false) String q060301, 
			@RequestParam(value="q060302", required=false) String q060302, @RequestParam(value="q060303", required=false) String q060303, @RequestParam(value="q060304", required=false) String q060304, @RequestParam(value="q060305", required=false) String q060305, 
			@RequestParam(value="q060306", required=false) String q060306, @RequestParam(value="q060307", required=false) String q060307, @RequestParam(value="q060308", required=false) String q060308, @RequestParam(value="q060309", required=false) String q060309, 
			@RequestParam(value="q060310", required=false) String q060310, @RequestParam(value="q060311", required=false) String q060311, @RequestParam(value="q060312", required=false) String q060312, @RequestParam(value="q060313", required=false) String q060313, 
			@RequestParam(value="q060314", required=false) String q060314, @RequestParam(value="q060315", required=false) String q060315, @RequestParam(value="q060401", required=false) String q060401, @RequestParam(value="q060402", required=false) String q060402, 
			@RequestParam(value="q060403", required=false) String q060403, @RequestParam(value="q060404", required=false) String q060404, @RequestParam(value="q060405", required=false) String q060405, @RequestParam(value="q060406", required=false) String q060406, 
			@RequestParam(value="q060407", required=false) String q060407, @RequestParam(value="q060408", required=false) String q060408, @RequestParam(value="q060409", required=false) String q060409, @RequestParam(value="q060410", required=false) String q060410, 
			@RequestParam(value="q060501", required=false) String q060501, @RequestParam(value="q060502", required=false) String q060502, @RequestParam(value="q060503", required=false) String q060503, @RequestParam(value="q060504", required=false) String q060504, 
			@RequestParam(value="q060505", required=false) String q060505, @RequestParam(value="q060506", required=false) String q060506, @RequestParam(value="q060507", required=false) String q060507, @RequestParam(value="q060508", required=false) String q060508, 
			@RequestParam(value="q060509", required=false) String q060509, @RequestParam(value="q060510", required=false) String q060510, @RequestParam(value="q060511", required=false) String q060511, @RequestParam(value="q060512", required=false) String q060512, 
			@RequestParam(value="q060513", required=false) String q060513, @RequestParam(value="q060601", required=false) String q060601, @RequestParam(value="q060602", required=false) String q060602, @RequestParam(value="q060603", required=false) String q060603, 
			@RequestParam(value="q060604", required=false) String q060604, @RequestParam(value="q060605", required=false) String q060605, @RequestParam(value="q060606", required=false) String q060606, @RequestParam(value="q060607", required=false) String q060607, 
			@RequestParam(value="q060608", required=false) String q060608, @RequestParam(value="q060609", required=false) String q060609, @RequestParam(value="q060610", required=false) String q060610, @RequestParam(value="q060611", required=false) String q060611, 
			@RequestParam(value="q060612", required=false) String q060612, @RequestParam(value="q060613", required=false) String q060613, @RequestParam(value="q060614", required=false) String q060614, @RequestParam(value="q060615", required=false) String q060615, 
			@RequestParam(value="q060616", required=false) String q060616, @RequestParam(value="q060617", required=false) String q060617, @RequestParam(value="q060618", required=false) String q060618, @RequestParam(value="q060619", required=false) String q060619, 
			@RequestParam(value="q060620", required=false) String q060620, @RequestParam(value="q060621", required=false) String q060621, @RequestParam(value="q07grade", required=false) String q07grade, @RequestParam(value="q070000", required=false) String q070000, 
			@RequestParam(value="q080000", required=false) String q080000, @RequestParam(value="q080100", required=false) String q080100, @RequestParam(value="q080200", required=false) String q080200, @RequestParam(value="q080300", required=false) String q080300, 
			@RequestParam(value="q080400", required=false) String q080400, @RequestParam(value="q080500", required=false) String q080500, @RequestParam(value="q080600", required=false) String q080600, @RequestParam(value="q080700", required=false) String q080700, 
			@RequestParam(value="q090000", required=false) String q090000, @RequestParam(value="q060700", required=false) String q060700, @RequestParam(value="q060800", required=false) String q060800, @RequestParam(value="q060900", required=false) String q060900, 
			@RequestParam(value="q100100", required=false) String q100100, @RequestParam(value="q100200", required=false) String q100200, @RequestParam(value="q100300", required=false) String q100300, @RequestParam(value="q100400", required=false) String q100400, 
			@RequestParam(value="q100500", required=false) String q100500, @RequestParam(value="q100600", required=false) String q100600, @RequestParam(value="q100700", required=false) String q100700, @RequestParam(value="q100800", required=false) String q100800, 
			@RequestParam(value="q100900", required=false) String q100900, @RequestParam(value="q101000", required=false) String q101000, @RequestParam(value="q101100", required=false) String q101100, @RequestParam(value="q101200", required=false) String q101200)
	{
		HttpSession session = request.getSession();
		
		// 세션 체크후 로그인중이면 입력받은 파라미터를 가지고 THECUTE에 쿼리 날리고 아니면 로그인페이지로 이동
		try {
			String id = (String)session.getAttribute("user_id");
			if (id != null) {
				DBCommon<Research> dbCommon = new DBCommon<Research>();
				
				// 항목별 만족도 재정의
				double temp = Math.ceil(Math.pow((Integer.parseInt(q100100) + Integer.parseInt(q100200) + Integer.parseInt(q100300) + Integer.parseInt(q100400) + Integer.parseInt(q100500) +
				Integer.parseInt(q100600) + Integer.parseInt(q100700) + Integer.parseInt(q100800) + Integer.parseInt(q100900) + Integer.parseInt(q101000) +
				Integer.parseInt(q101100) + Integer.parseInt(q101200)) / 12, 2)) * 1.2;
				
				// 종합 만족도 재정의 (항목별 만족도 + 전반적 만족도 + 재방문 의향 + 추천 의향)
				double temp2 = temp + 
						(Math.pow(Double.parseDouble(q060700), 2) * 1.6) + 
						(Math.pow(Double.parseDouble(q060800), 2) * 0.8) + 
						(Math.pow(Double.parseDouble(q060900), 2) * 0.6);
						
				String q10grade = String.valueOf(temp2);
				
				// 입력받은 설문조사 데이터를 THECUTE 테이블에 insert
				dbCommon.insertData(new Research(age, sex, sido, jobgroup, month, q010000, q020000,  q040100, q040200, q040300, q040400, q040500, q040600,
						 q040700, q040800, q040900, q041000, q041100, q050000, q060101, q060102, q060103, q060104, q060105, q060106, q060107, q060108, q060109,
						 q060110, q060111, q060112, q060113, q060114, q060115, q060116, q060301, q060302, q060303, q060304, q060305, q060306, q060307, q060308, 
						 q060309, q060310, q060311, q060312, q060313, q060314, q060315, q060401, q060402, q060403, q060404, q060405, q060406, q060407, q060408, 
						 q060409, q060410, q060501, q060502, q060503, q060504, q060505, q060506, q060507, q060508, q060509, q060510, q060511, q060512, q060513, 
						 q060601, q060602, q060603, q060604, q060605, q060606, q060607, q060608, q060609, q060610, q060611, q060612, q060613, q060614, q060615,
						 q060616, q060617, q060618, q060619, q060620, q060621, q07grade, q070000, q080000, q080100, q080200, q080300, q080400, q080500, q080600, 
						 q080700, q090000, q10grade, q060700, q060800, q060900, q100100, q100200, q100300, q100400, q100500, q100600, q100700, q100800, q100900, 
						 q101000, q101100, q101200), id);
//				model.addAttribute("message", "설문조사에 참여해 주셔서 감사합니다.");
				
				return "redirect:/";
			}
		} catch (NullPointerException e) {
			return "redirect:/login";
		}
		return "redirect:/login";
	}
	
}
