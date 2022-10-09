package com.team03.prototype.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.team03.prototype.command.AuthCommand;
import com.team03.prototype.command.BestListCommand;
import com.team03.prototype.command.BottomListCommand;
import com.team03.prototype.command.EtcListCommand;
import com.team03.prototype.command.IdentificationUserCommand;
import com.team03.prototype.command.MonthlyCompleteCommand;
import com.team03.prototype.command.MonthlyOrderCommand;
import com.team03.prototype.command.NewListCommand;
import com.team03.prototype.command.OneOrderSaveCommand;
import com.team03.prototype.command.OrderListCommand;
import com.team03.prototype.command.OrderRequestCommand;
import com.team03.prototype.command.OrderSaveCommand;
import com.team03.prototype.command.OrderSearchCommand;
import com.team03.prototype.command.OrderStateCurrentCommand;
import com.team03.prototype.command.OuterListCommand;
import com.team03.prototype.command.PMOrderListCommand;
import com.team03.prototype.command.PTCommand;
import com.team03.prototype.command.PTHomeViewCommand;
import com.team03.prototype.command.PTHomeWriteCommand;
import com.team03.prototype.command.PTJoinCommand;
import com.team03.prototype.command.PTProductDeleteCommand;
import com.team03.prototype.command.PTProductListCommand;
import com.team03.prototype.command.PTProductModifyCommand;
import com.team03.prototype.command.PMProductViewCommand;
import com.team03.prototype.command.PTProductWriteCommand;
import com.team03.prototype.command.PTrBoardContentCommand;
import com.team03.prototype.command.PTrBoardDeleteCommand;
import com.team03.prototype.command.PTrBoardListCommand;
import com.team03.prototype.command.PTrBoardModifyCommand;
import com.team03.prototype.command.PTrBoardPageListCommand;
import com.team03.prototype.command.PTrBoardReplyCommand;
import com.team03.prototype.command.PTrBoardReplyViewCommand;
import com.team03.prototype.command.PTrBoardSearchListCommand;
import com.team03.prototype.command.UserReviewSearchListCommand;
import com.team03.prototype.command.PTrBoardWriteCommand;
import com.team03.prototype.command.PmOrderDetailsCommand;
import com.team03.prototype.command.PmOrderStateModifyCommand;
import com.team03.prototype.command.ProductCurrentCommand;
import com.team03.prototype.command.ProductReviewListCommand;
import com.team03.prototype.command.ProductViewCommand;
import com.team03.prototype.command.TopListCommand;
import com.team03.prototype.command.UserInfoModifyCommand;
import com.team03.prototype.command.UserInfoSaveCommand;
import com.team03.prototype.command.UserOrderedListCommand;
import com.team03.prototype.command.UserReviewListCommand;
import com.team03.prototype.dao.PTBoardDao;
import com.team03.prototype.dao.PTSecDao;
import com.team03.prototype.dto.AuthUserDto;
import com.team03.prototype.dto.HomeDto;
import com.team03.prototype.dto.MonthlyOrderDto;
import com.team03.prototype.dto.OrderStateCurrentGraphDto;
import com.team03.prototype.dto.PTJoinDto;
import com.team03.prototype.dto.PTProductDto;
import com.team03.prototype.dto.PTrBoardDto;
import com.team03.prototype.dto.ProductCurrentGraphDto;
import com.team03.prototype.naver.NaverLoginBO;
import com.team03.prototype.util.Constant;

@Controller
public class PrototypeController {
	private PTCommand com;
	
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	public void setPasswordEncoder(BCryptPasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
		Constant.passwordEncoder = passwordEncoder;
	}
	//PTSecDao class bean
	private PTSecDao sdao;
	@Autowired
	public void setSdao(PTSecDao sdao) {
		this.sdao = sdao;
		Constant.sdao = sdao;
	}
	//PTBoardDao class bean
	private PTBoardDao bdao;
	@Autowired
	public void setBdao(PTBoardDao bdao) {
		this.bdao = bdao;
		Constant.bdao = bdao;
	}
	//NaverLogin
	private NaverLoginBO naverLoginBO;
	@Autowired
	public void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	//google login
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;


	/*요청처리*/
//home~Log~main
	//home request
	@RequestMapping("/home")
	public String home(HttpServletRequest request, Model model) {
		//슬라이드와 메인 사진 호출
		com = new PTHomeViewCommand();
		com.execute(request, model);
		//home 화면에 newList
		com = new NewListCommand();
		com.execute(request, model);
		return "home";
	}
	//joinView
	@RequestMapping("/joinView")
	public String joinView() {
		return "joinView";
	}
	//join
	@RequestMapping(value="/join", produces="application/text; charset=UTF8")
	@ResponseBody
	public String join(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("join 요청");
		com = new PTJoinCommand();
		com.execute(request, model);
		String result = (String)request.getAttribute("result");
		if(result.equals("success")) {
			return "join-success";
		}
		else {
			return "join-failed";
		}
	}
	//loginView
	@RequestMapping("/loginView")
	public String loginView(HttpServletRequest request, HttpSession session, Model model) {
		System.out.println("loginView 요청");
		socialUrl(model, session);
		return "loginView";
	}

	private void socialUrl(Model model, HttpSession session) {
		//kakao
		String kakao_url = "https://kauth.kakao.com/oauth/authorize"
				+ "?client_id=d3a73e8cf18d3129ba8b61b086e8db48"
				+ "&redirect_uri=https://localhost:8443/prototype/kredirect"
				+ "&response_type=code";
		model.addAttribute("kakao_url",kakao_url);
		//naver
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("naver: " +naverAuthUrl);
		model.addAttribute("naver_url", naverAuthUrl);
		//google
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE,googleOAuth2Parameters);
		System.out.println("구글:" + url);
		model.addAttribute("google_url", url);
	}
	
	//kakao
	@RequestMapping(value="/kredirect", produces="application/json; charset=UTF8")
	public String kredirect(@RequestParam String code, HttpServletResponse response, 
			Model model, HttpServletRequest request) throws Exception{
		System.out.println("#########" + code);
		//kakao에서 보낸 정보가 담긴 토큰
		String access_Token = getKakaoAccessToken(code,response);
		System.out.println("###access_Token###: " + access_Token);
		//토큰을 해석해서 사용자정보를 map에 담음
		HashMap<String, Object> userInfo = getKakaoUserInfo(access_Token);
		String email = (String)userInfo.get("email");
		String authUsername = "kakao_"+email;
		String authPw =(String)userInfo.get("nickname");
		String cryptPw = passwordEncoder.encode(authPw);
		
		AuthUserDto dto = new AuthUserDto(authUsername,cryptPw,null);
		authDB(request,model,dto);
		
		model.addAttribute("authUser",authUsername);
		model.addAttribute("authPw",authPw);
		
		return "socialLogin";
	}

	public HashMap<String,Object> getKakaoUserInfo (String access_Token) {
			HashMap<String, Object> userInfo = new HashMap<String, Object>();
			String reqURL = "https://kapi.kakao.com/v2/user/me";
			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Authorization", "Bearer " + access_Token);
				int responseCode = conn.getResponseCode();
				System.out.println("responseCode : " + responseCode);
				BufferedReader br = 
						new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));

				String line = "";
		        String result = "";
		        while ((line = br.readLine()) != null)  {
		        	 result += line;
		        }
		        System.out.println("response body : " + result);
		        
		        //정보 추출
		        JSONParser parser = new JSONParser();
		        Object obj = parser.parse(result);
		        JSONObject jsonObj = (JSONObject) obj;
		        String id = jsonObj.get("id").toString();
		        JSONObject properties = (JSONObject)jsonObj.get("properties");
		        JSONObject kakao_account = (JSONObject)jsonObj.get("kakao_account"); 
		        String accessToken = (String)properties.get("access_token");
		        String nickname = (String)properties.get("nickname");
		        String email = (String)kakao_account.get("email");
		        userInfo.put("accessToken", access_Token);
	            userInfo.put("nickname", nickname);
	            userInfo.put("email", email);
	            userInfo.put("id", id);
	            System.out.println("=============");
	            System.out.println("acces token  " + accessToken);
	            System.out.println("nickname  " + nickname);
	            System.out.println("email  " + email); 
	            System.out.println("id  " + id);
			}
			catch(Exception e1) {
				e1.getMessage();
			}
			return userInfo;
		}	

		public String getKakaoAccessToken (String authorize_code,HttpServletResponse response)  {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8"); 
			String access_Token = "";
			String refresh_Token = "";
			String reqURL = "https://kauth.kakao.com/oauth/token";
			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("POST");
				conn.setDoOutput(true);
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
				StringBuilder sb = new StringBuilder();
				sb.append("grant_type=authorization_code");
				sb.append("&client_id=d3a73e8cf18d3129ba8b61b086e8db48");
				sb.append("&redirect_uri=https://localhost:8443/prototype/kredirect");
				sb.append("&code=" + authorize_code);
				bw.write(sb.toString());
				bw.flush();
				int responseCode = conn.getResponseCode();
				System.out.println("responseCode : " + responseCode);
				 BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
				 String line = "";
		         String result = "";
		         while ((line = br.readLine()) != null) {
		        	result += line;
		         }
		         System.out.println("response body : " + result);
		         JSONParser parser = new JSONParser();
		         Object obj = parser.parse(result);
		         JSONObject jsonObj = (JSONObject) obj;
		         access_Token = (String)jsonObj.get("access_token");
		         refresh_Token = (String)jsonObj.get("refresh_token");
				 System.out.println("access_token : " + access_Token);
				 System.out.println("refresh_token : " + refresh_Token);
				 br.close();
				 bw.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return access_Token; 
		}
		
		@RequestMapping(value="/nredirect", produces="application/json; charset=UTF8")
		public String nredirect(@RequestParam String code, 
				@RequestParam String state, HttpSession session, Model model, HttpServletRequest request) throws Exception{
			System.out.println("nredirect 요청");
			System.out.println("state: " + state);
			OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
			String apiResult = naverLoginBO.getUserProfile(oauthToken);
			System.out.println("apiResult: " + apiResult);
			//String 형식인 apiResult를 JSON Object형태로 바꿈
			JSONParser parser = new JSONParser();//org.json.simple에서 만든 JSON
			Object obj = parser.parse(apiResult);//자바의 String 객체를 자바의 Object객체로
			JSONObject jsonObj = (JSONObject) obj;//자바의 Object를 JSONObject로
			//결과가 저장되어있는 JSON형식의 객체
			JSONObject responseObj =(JSONObject)jsonObj.get("response");
			System.out.println("naver user 정보: " + responseObj);
			//response의 값 반환
			String email = (String)responseObj.get("email");
			String name = (String)responseObj.get("name");
			String id = (String)responseObj.get("id");
			System.out.println("email: " + email + " /name: " + name + " /id: " + id);
			//DB등록 준비(실제에서는 위의 정보 확인 없이 바로 auth-과정)
			String authUsername = "naver_"+ email;
			String authPw = name;
			String cryptPw = passwordEncoder.encode(authPw);
			AuthUserDto dto = new AuthUserDto(authUsername,cryptPw,null);
			//db입력 method 호출
			authDB(request,model,dto);
			//model에 입력
			model.addAttribute("authUser",authUsername);
			model.addAttribute("authPw",authPw);
			return "socialLogin";
		}	

		@RequestMapping(value="/gredirect", produces="application/text; charset=UTF8")
		public String googleCallback(Model model, @RequestParam String code, HttpServletResponse response, HttpServletRequest request) 
				throws IOException{
			System.out.println("google redirect 요청");
			//google code 발행, OAuth2를 처리하는 객체
			OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
			//access token 처리 객체
			AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(), null);
			String accessToken = accessGrant.getAccessToken();
			HashMap<String, Object> map = getGoogleUserInfo(accessToken, response);
			String email = (String)map.get("email");
			String name = (String)map.get("name");
			String id = (String)map.get("id");
			System.out.println("email: " + email + "/ name: " + name + "/ id: " + id);
			//DB에 저장할 계정과 비밀번호
			String authUsername = "google_"+email;
			String authPw = (String)map.get("name");
			String cryptPw = passwordEncoder.encode(authPw);
			AuthUserDto dto = new AuthUserDto(authUsername,cryptPw,null);
			//DB등록 method 호출
			authDB(request,model,dto);
			model.addAttribute("authUser",authUsername);
			model.addAttribute("authPw",authPw);
			return "socialLogin";			
		}
		//구글 사용자 정보
		   public HashMap<String,Object> getGoogleUserInfo(String access_Token,HttpServletResponse response) {
		      response.setCharacterEncoding("UTF-8");
		      response.setContentType("text/html;charset=UTF-8"); 
		      HashMap<String,Object> gUserInfo = new HashMap<String,Object>();
		
		      String reqURL = "https://www.googleapis.com/userinfo/v2/me?access_token=" + access_Token;
		      try {
		         URL url = new URL(reqURL); 
		         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		         conn.setRequestProperty("Authorization", "Bearer " + access_Token);
		         int responseCode = conn.getResponseCode(); 
		         System.out.println("responseCode : "+responseCode);
		         if(responseCode == 200) {
		            BufferedReader br = 
		               new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8")); 
		            String line = ""; 
		            String result = "";
		            while ((line = br.readLine()) != null) {
		               result += line;
		            }
		            JSONParser parser = new JSONParser(); //문자열을 json객체화하는 객체
		            Object obj = parser.parse(result);
		            JSONObject jsonObj = (JSONObject) obj;
		            String name_obj = (String)jsonObj.get("name");
		            String email_obj = (String)jsonObj.get("email");
		            String id_obj = "GOOGLE_" + (String)jsonObj.get("id");
		            
		            gUserInfo.put("name", name_obj); 
		            gUserInfo.put("email", email_obj); 
		            gUserInfo.put("id", id_obj);
		            
		            System.out.println("gUserInfo : " + gUserInfo);   
		         }
		      }
		      catch(Exception e) {
		         e.printStackTrace();
		      }
		      return gUserInfo;
		   }

	private void authDB(HttpServletRequest request, Model model, AuthUserDto dto) {
		   com = new AuthCommand();
		   request.setAttribute("dto", dto);
		   com.execute(request, model);
	   }	
	
	//main(login success page) 
	@RequestMapping("/main")
	public String main(HttpServletRequest request, Model model, Authentication authentication) {
		System.out.println("main요청");
		getUsername(authentication, request);
		String username = (String)request.getAttribute("username");
		String auth = (String)request.getAttribute("auth");
		System.out.println("유저 " + username +"의 권한: " + auth);
		//슬라이드와 메인 사진 호출
		com = new PTHomeViewCommand();
		com.execute(request, model);
		//home 화면에 newList/bestList
		com = new NewListCommand();
		com.execute(request, model);
		com = new BestListCommand();
		com.execute(request, model);
		return "main";
	}
	//main의 일반 method
	private void getUsername(Authentication authentication, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		String username = userDetails.getUsername();
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		String auth = authorities.toString();
		request.setAttribute("username", username);
		request.setAttribute("auth", auth);
	}
	//log process request
	@RequestMapping("/processLogin")
	public ModelAndView processLogin(
			@RequestParam(value="log", required=false) String log,
			@RequestParam(value="error", required=false) String error,
			@RequestParam(value="logout", required=false) String logout,
			HttpSession session, Model model
			) {
		System.out.println("processLogin 요청(log/error/logout):" + log +"/"+error+"/"+logout);
		ModelAndView mav = new ModelAndView();
		if(log!=null && log!="") {
			mav.addObject("log","before login!");
		}
		if(error!=null && error!="") {
			mav.addObject("error","Invalid username or password");
		}
		if(logout!=null && logout!="") {
			mav.addObject("logout","You've been logged out successfully");
		} 
		mav.setViewName("loginView");
		return mav;
	}
	@RequestMapping("/logoutView")
	public String logoutView() {
		System.out.println("logoutView 요청");
		return "logoutView";
	}		
		
	//lookbook
	@RequestMapping("/lookbook")
	public String lookbook(HttpServletRequest request, Model model) {
		return "lookbook";
	}
	
//SHOP
	//shop-bottom
	@RequestMapping("/bottom")
	public String bottom(HttpServletRequest request, Model model) {
		System.out.println("bottom list request");
		com = new BottomListCommand();
		com.execute(request, model);
		return "bottom";
	}	
	//shop-outer
	@RequestMapping("/outerView")
	public String outerView(HttpServletRequest request, Model model) {
		System.out.println("outer list request");
		com = new OuterListCommand();
		com.execute(request, model);
		return "outerView";
	}
	//shop-top
	@RequestMapping("/topView")
	public String topView(HttpServletRequest request, Model model) {
		System.out.println("top list request");
		com = new TopListCommand();
		com.execute(request, model);
		return "topView";
	} 
	//shop-etc
	@RequestMapping("/etcView")
	public String etcView(HttpServletRequest request, Model model) {
		System.out.println("etc list request");
		com = new EtcListCommand();
		com.execute(request, model);
		return "etcView";
	}
	//newView
	@RequestMapping("/newView")
	public String newView(HttpServletRequest request, Model model) {
		System.out.println("new list request");
		com = new NewListCommand();
		com.execute(request, model);
		return "newView";
	}
	//bestView
	@RequestMapping("/bestView")
	public String bestView(HttpServletRequest request, Model model) {
		System.out.println("best list request");
		com = new BestListCommand();
		com.execute(request, model);
		return "bestView";
	}
	
//user pages
	//myPage
	@RequestMapping("/myPage")
	public String myPage() {
		System.out.println("productCart request");
		return "myPage"; 
	}
	//myInfo
	@RequestMapping("/myInfo")
	public String myInfo() {
		System.out.println("myInfo");
		return "identificationPage";
	}
	//password Identify
	@RequestMapping(value="/passwordConf", produces="application/text;charset=UTF8")
	@ResponseBody
	public String passwordConf(HttpServletRequest request, HttpServletResponse response, Model model) {
		com = new IdentificationUserCommand();
		com.execute(request, model);
		String result = (String)request.getAttribute("result");
		if(result.equals("success")) {
			return "identify-success";			
		}
		else {
			return "identify-failed";
		}
	}
	@RequestMapping("/myInfoModify")
	public String myInfoModify(HttpServletRequest request,Model model) {
		com = new UserInfoModifyCommand();
		com.execute(request, model);
		return "userInfoModify";
	}
	@RequestMapping("/userInfoModify")
	public String userInfoModify(HttpServletRequest request,Model model,PTJoinDto dto) {
		request.setAttribute("userModiDto", dto);
		com = new UserInfoSaveCommand();
		com.execute(request, model);
		return "myPage";
	}

	//product details
	@RequestMapping("/productdetails")
	public String productdetails(HttpServletRequest request, Model model) {
		System.out.println("product detail request");
		com = new ProductViewCommand();
		com.execute(request, model);
		com = new ProductReviewListCommand();
		com.execute(request,model);
		return "productdetails";
	}
	//productCart 
	@RequestMapping("/productCart")
	public String productCart() {
		System.out.println("productCart request");
		return "productCart";
	}
	//orderSave from cart
	@RequestMapping("/orderSave")
	public String orderSave(HttpServletRequest request, Model model) {
		System.out.println("orderSave request");
		com = new OrderSaveCommand();
		com.execute(request, model);
		return "myPage";
	}
	//orderSave from details
	@RequestMapping(value="/oneOrderRequest", produces="application/json;charset=UTF8")
	@ResponseBody
	public String oneOrderRequest(HttpServletRequest request, Model model) {
		System.out.println("oneOrderRequest request");
		com = new OneOrderSaveCommand();
		com.execute(request, model);
		String result=request.getParameter("pId")+"번 상품 "+request.getParameter("opQuanty")+"개를 저장했습니다";
		return result;
	}
	
	//orderList
	@RequestMapping("/orderList")
	public String orderList(HttpServletRequest request, Model model) {
		System.out.println("orderList request");
		com = new OrderListCommand();
		com.execute(request, model);
		return "orderList";
	}
	//order request 
	@RequestMapping(value="/orderRequest", produces="application/json;charset=UTF8")
	public String orderRequest(HttpServletRequest request, Model model){
		System.out.println("orderRequest request");
		com = new OrderRequestCommand();
		com.execute(request, model);
		return "main"; 
	}
	//ordered list
	@RequestMapping("/userOrderedList")
	public String userOrderedList(HttpServletRequest request, Model model) {
		System.out.println("userOrderedList request");
		com = new UserOrderedListCommand();
		com.execute(request, model);
		return "userOrderedList"; 
	}
	//orderDetails(ordered list에서 접근할 정보)
	@RequestMapping("/orderDetails")
	public String orderDetails(HttpServletRequest request, Model model) {
		return "orderDetails";
	}
	//myReview List
	@RequestMapping("/myReiview")
	public String myReiview(HttpServletRequest request, Model model) {
		System.out.println("myReiview request");
		com = new UserReviewListCommand();
		com.execute(request,model);
		return "myrBoardView";
	}
	//My review content
	@RequestMapping(value="/myrContentView", produces = "application/text; charset=UTF8") 
	public String myrContentView(HttpServletRequest request,Model model) {
		System.out.println("myrContentView request");
		com = new PTrBoardContentCommand();
		com.execute(request,model);		
		return "myrContentView";
	}
	@RequestMapping("/productReviewView")
	public String productReviewView(HttpServletRequest request,Model model) {
		System.out.println("productReviewView request");
		com = new ProductReviewListCommand();
		com.execute(request,model);
		return "productReviewList";
	}
	@RequestMapping("/productReviewContent")
	public String productReviewContent(HttpServletRequest request,Model model) {
		System.out.println("productReviewContent request");
		com = new PTrBoardContentCommand();
		com.execute(request,model);		
		return "productReviewContentView";
	}
	//reviewBoard
	@RequestMapping("/rBoard")
	public String eBoard(HttpServletRequest request, Model model) {
		System.out.println("rBoard요청");
		com = new PTrBoardListCommand();
		com.execute(request,model);
		return "rBoardView";
	}
	@RequestMapping("/rBoardView")
	public String rBoardView(HttpServletRequest request,Model model) {
		System.out.println("rBoardView 요청");
		com = new PTrBoardListCommand();
		com.execute(request,model);
		return "rBoardView";
	}
	//review writing form
	@RequestMapping(value="/rWriteView",produces = "application/text; charset=UTF8") 
	public String writeView() {
		System.out.println("writeView요청");
		return "rWriteView";
	}
	//review write request
	@RequestMapping(value= "/rWrite",produces = "application/text; charset=UTF8") 
    public String rWrite(PTrBoardDto dto, HttpServletRequest request,Model model) {
		System.out.println("rWrite요청");
		request.setAttribute("rdto", dto);
		com = new PTrBoardWriteCommand();
		com.execute(request,model);
		com = new PTrBoardListCommand();
		com.execute(request,model);
		return "rBoardView";
	}
	//review content view
	@RequestMapping("/rContentView") 
	public String rContentView(HttpServletRequest request,Model model) {
		System.out.println("rcontentView요청입니다.");
		com = new PTrBoardContentCommand();
		com.execute(request,model);		
		return "rContentView";
	}
	//review modify
	@RequestMapping(value= "/rmodify",produces = "application/text; charset=UTF8") 
	public String rmodify(HttpServletRequest request,Model model) {
		System.out.println("review modify request");
		com = new PTrBoardModifyCommand();
		com.execute(request, model);
		//수정 후 리스트
		com = new PTrBoardListCommand();
		com.execute(request, model);
		return "myPage";
	}
	//review delete
	@RequestMapping("/rdelete")
	public String rdelete(HttpServletRequest request,Model model) {
		System.out.println("review delete request");
		com = new PTrBoardDeleteCommand();
		com.execute(request,model);
		com = new PTrBoardListCommand();
		com.execute(request,model);
		return "rBoardView";
	}
	//reply view
	@RequestMapping("/replyView")
	public String replyView(HttpServletRequest request,Model model) {
		System.out.println("replyView 요청");
		com = new PTrBoardReplyViewCommand();
		com.execute(request, model);
		return "replyWrite";
	}
	//reply write 
	@RequestMapping(value= "/reply",produces = "application/text; charset=UTF8") 
	public String reply(PTrBoardDto dto,HttpServletRequest request,Model model) {
		System.out.println("reply 요청");
		com = new PTrBoardReplyCommand();
		request.setAttribute("formDto", dto);
		com.execute(request,model);
		com = new PTrBoardListCommand();
		com.execute(request,model);
		return "rBoardView";
	}
	//QnA
	@RequestMapping("/faq")
	public String faq() {
		System.out.println("FAQ request");
		return "faq";
	}
	//pageNumber
	@RequestMapping("/rlist")
	public String purl(HttpServletRequest request, Model model) {
		System.out.println("rlist요청");
		System.out.println(request.getParameter("pageNo"));
		com = new PTrBoardPageListCommand();
		com.execute(request,model);		
		return "pageBoard";
	}
	//search review list
	@RequestMapping("/searchBoard")
	public String searchBoard(HttpServletRequest request, Model model) {
		System.out.println("searchBoard요청");
		com = new PTrBoardSearchListCommand();
		com.execute(request,model);		
		return "searchBoard";
	}
	@RequestMapping("/mySearchBoard")
	public String mySearchBoard(HttpServletRequest request, Model model) {
		System.out.println("mySearchBoard request");
		com = new UserReviewSearchListCommand();
		com.execute(request,model);		
		return "searchBoard";
	}

//admin page
	//관리자페이지 
	@RequestMapping("/productManager")
	public String productManager(HttpServletRequest request, Model model) {
		return "productManager";
	}
	@RequestMapping("/managerHome")
	public String pmHome() {
		System.out.println("PM manager home request");
		return "pmHome";
	}
	@RequestMapping("/pmrBoardView")
	public String pmrBoardView(HttpServletRequest request,Model model) {
		System.out.println("rBoardView 요청");
		com = new PTrBoardListCommand();
		com.execute(request,model);
		return "pmrBoardView";
	}
	//review content view
	@RequestMapping("/pmrContentView") 
	public String pmrContentView(HttpServletRequest request,Model model) {
		System.out.println("rcontentView요청입니다.");
		com = new PTrBoardContentCommand();
		com.execute(request,model);		
		return "pmrContentView";
	}
	//상품등록화면
	@RequestMapping("/productRegi")
	public String pmProductWrite() {
		System.out.println("PM product writeView request");
		return "pmProductWrite";
	}
	//CK Editor
	@RequestMapping("/ckedit")
	public void ckedit(MultipartHttpServletRequest request, HttpServletResponse response) throws IOException{
	System.out.println("ck editor");
	String path = "/prototype/editUpload";
	String real_save_path = request.getServletContext().getRealPath(path);
	System.out.println("real path: " + real_save_path);

	MultipartFile mf = request.getFile("upload");
	String originFileName = mf.getOriginalFilename();
	long fileSize = mf.getSize();
	System.out.println(originFileName + "// size: " + fileSize);//file 용량 체크
	//파일이름 중복방지
			String uuid = UUID.randomUUID().toString();
			//파일 저장
			String path1 = "F:/WorkSpace/z01Prototype/src/main/webapp/resources/editUpload/";//workspace
			String path2 = "F:/DevelopStudyResource/TomcatServer/apache-tomcat-9.0.63/wtpwebapps/z01Prototype/resources/editUpload/";//tomcat(정식 서비스에선 삭제)
			String safeFile1 = path1 + uuid + originFileName;
			String safeFile2 = path2 + uuid + originFileName;
			System.out.println("saved path: " + safeFile1);
			String changeFileName = uuid + originFileName;
			try {
				mf.transferTo(new File(safeFile1));
				mf.transferTo(new File(safeFile2));
			}
			catch(Exception e) {
				e.printStackTrace();
			} 
			//CK Editor 편집창
			JSONObject outData = new JSONObject();
			outData.put("uploaded", true);
			outData.put("url",request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+changeFileName);
			//key값으로 url 검토
			String url = (String)outData.get("url");
			System.out.println("uploaded url: " + url);
			//HttpServletResponse를 통해 전송
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(outData.toString());
		}
	//productWrite
	@RequestMapping("/productWrite")
	public String productWrite(MultipartHttpServletRequest mtpRequest, Model model) {
		System.out.println("productWrite request");
		//form data
		int pId=0;
		String pType = mtpRequest.getParameter("pType");
		String pName = mtpRequest.getParameter("pName");
		String price = mtpRequest.getParameter("pPrice");
		int pPrice = Integer.parseInt(price);
		String quanty = mtpRequest.getParameter("pQuanty");
		int pQuanty = Integer.parseInt(quanty);
		String pContent = mtpRequest.getParameter("pContent");
		String pPhoto = null; 
		String[] pBoards = mtpRequest.getParameterValues("pBoard"); 
		String pBoard = Arrays.toString(pBoards);
		String pState = mtpRequest.getParameter("pState");
		String pColor = mtpRequest.getParameter("pColor");
		String pSize = mtpRequest.getParameter("pSize");
		
		//Main Photo file
		MultipartFile mf =mtpRequest.getFile("pPhoto");
		String path1 = "F:/WorkSpace/z01Prototype/src/main/webapp/resources/image/";//workspace
		String path2 = "F:/DevelopStudyResource/TomcatServer/apache-tomcat-9.0.63/wtpwebapps/z01Prototype/resources/image/";//tomcat(정식 서비스에선 삭제)
		
		String originName = mf.getOriginalFilename();
		long fileSize = mf.getSize();
		long pfix = System.currentTimeMillis();
		String safeFile1 = path1 + pfix + originName;
		String safeFile2 = path2 + pfix + originName;
		pPhoto = pfix + originName;
		try {
			mf.transferTo(new File(safeFile1));
			mf.transferTo(new File(safeFile2));
		}
		catch(Exception e) {
			e.printStackTrace();
		} 
		
		PTProductDto pdto = new PTProductDto(pId,pType,pName,pPrice,pQuanty,pContent,pPhoto,pBoard,pState,null,pColor,pSize);
		mtpRequest.setAttribute("pdto",pdto);
		com = new PTProductWriteCommand();
		com.execute(mtpRequest, model);
		return "productManager";
	}
	@RequestMapping("/productList")
	public String productList(HttpServletRequest request, Model model) {
		System.out.println("PM product list request");
		com = new PTProductListCommand();
		com.execute(request, model);
		return "pmProductList";
	}
	@RequestMapping("/pmProductView")
	public String pmProductView(HttpServletRequest request, Model model) {
		System.out.println("PM productView");
		com = new PMProductViewCommand();
		com.execute(request, model);
		return "pmProductView";
	}
	@RequestMapping("/productModify")
	public String productModify(MultipartHttpServletRequest mtpRequest, Model model) {
		System.out.println("productModify request");
		//form data
		String pid=(String)mtpRequest.getParameter("pId");
		int pId=Integer.parseInt(pid);
		String pType = mtpRequest.getParameter("pType");
		String pName = mtpRequest.getParameter("pName");
		String price = mtpRequest.getParameter("pPrice");
		int pPrice = Integer.parseInt(price);
		String quanty = mtpRequest.getParameter("pQuanty");
		int pQuanty = Integer.parseInt(quanty);
		String pContent = mtpRequest.getParameter("pContent");
		String[] pBoards = mtpRequest.getParameterValues("pBoard"); 
		String pBoard = Arrays.toString(pBoards);
		String pState = mtpRequest.getParameter("pState");
		String pColor = mtpRequest.getParameter("pColor");
		String pSize = mtpRequest.getParameter("pSize");
		String pPhoto;
		String originPhoto = mtpRequest.getParameter("originPhoto");
		if(originPhoto.equals("_Changed")) {
			//사진파일이 변경되면 업로드
			MultipartFile mf =mtpRequest.getFile("pPhoto");
			String path1 = "F:/WorkSpace/z01Prototype/src/main/webapp/resources/image/";//workspace
			String path2 = "F:/DevelopStudyResource/TomcatServer/apache-tomcat-9.0.63/wtpwebapps/z01Prototype/resources/image/";//tomcat(정식 서비스에선 삭제)
			
			String originName = mf.getOriginalFilename();
			long pfix = System.currentTimeMillis();
			String safeFile1 = path1 + pfix + originName;
			String safeFile2 = path2 + pfix + originName;
			pPhoto = pfix + originName;
			try {
				mf.transferTo(new File(safeFile1));
				mf.transferTo(new File(safeFile2));
			}
			catch(Exception e) {
				e.printStackTrace();
			} 
		}
		else {
			pPhoto = originPhoto;
		}
		System.out.println(pPhoto);
		PTProductDto pdto = new PTProductDto(pId,pType,pName,pPrice,pQuanty,pContent,pPhoto,pBoard,pState,null,pColor,pSize);
		mtpRequest.setAttribute("modidto",pdto);
		com = new PTProductModifyCommand();
		com.execute(mtpRequest, model);
		return "productManager";
	}
	@RequestMapping("/productDelete")
	public String productDelete(HttpServletRequest request, Model model) {
		System.out.println("productDelete request");
		com = new PTProductDeleteCommand();
		com.execute(request, model);
		com = new PTProductListCommand();
		com.execute(request, model);
		return "pmProductList"; 
	}
	//첫화면 수정화면
	@RequestMapping("/mainPage")
	public String mainPage(HttpServletRequest request, Model model) {
		com = new PTHomeViewCommand();
		com.execute(request, model);
		return "pmMainPageWriteView";
	}
	//home, main write(slide, mainPhoto, social link)
	@RequestMapping("/mainPageWrite")
	public String mainPageWrite(MultipartHttpServletRequest mtpRequest, Model model) throws IOException{
		System.out.println("mainPageWrite request");
		
		Date hmDate = new Date(System.currentTimeMillis());
		String hmInstar = mtpRequest.getParameter("hmInstar");
		String hmYoutube = mtpRequest.getParameter("hmYoutube");
		//사진파일 정보
		String hmSlide0 = null;
		String hmSlide1 = null;
		String hmSlide2 = null;
		long fileSize0=0;
		long fileSize1=1;
		long fileSize2=2;
		String hmMain = null;
		//받은 정보 분리
		List<MultipartFile> slideList = mtpRequest.getFiles("hmSlide");
		String path1 = "F:/WorkSpace/z01Prototype/src/main/webapp/resources/media/";//workspace
		String path2 = "F:/DevelopStudyResource/TomcatServer/apache-tomcat-9.0.63/wtpwebapps/z01Prototype/resources/media/";//tomcat(정식 서비스에선 삭제)
		
		for(int i=0; i<slideList.size(); i++) {
			MultipartFile slide = slideList.get(i);
			String originFileName = slide.getOriginalFilename();
			
			SimpleDateFormat uploadDateF = new SimpleDateFormat("yyyyMMddhhmm");
			String uploadDate = uploadDateF.format(new java.util.Date()).toString();
			String safeFile1 = path1+uploadDate+i+originFileName;
			String safeFile2 = path2+uploadDate+i+originFileName;
			//index에 따른 값입력
			switch(i) {
				case 0: hmSlide0 = uploadDate+i+originFileName;
						fileSize0 = slide.getSize();
						break;
				case 1: hmSlide1 = uploadDate+i+originFileName;
						fileSize1 = slide.getSize();
						break;
				case 2: hmSlide2 = uploadDate+i+originFileName;
						fileSize2 = slide.getSize();
						break;
			}
			try {
				slide.transferTo(new File(safeFile1));
				slide.transferTo(new File(safeFile2));
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println(hmSlide0+": "+fileSize0);
		System.out.println(hmSlide1+": "+fileSize1);
		System.out.println(hmSlide2+": "+fileSize2);
		//mainPhoto
		MultipartFile mainPhoto = mtpRequest.getFile("hmMain");
		String originFileName = mainPhoto.getOriginalFilename();
		SimpleDateFormat uploadDateF = new SimpleDateFormat("yyyyMMddhhmm");
		String uploadDate = uploadDateF.format(new java.util.Date()).toString();

		long mainSize = mainPhoto.getSize();
		String safeFile1 = path1+uploadDate+originFileName;
		String safeFile2 = path2+uploadDate+originFileName;
		hmMain =uploadDate+originFileName;
		System.out.println(hmMain+": "+mainSize);
		try {
			mainPhoto.transferTo(new File(safeFile1));
			mainPhoto.transferTo(new File(safeFile2));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		HomeDto dto = new HomeDto(hmDate,hmSlide0,hmSlide1,hmSlide2,hmMain,hmInstar,hmYoutube);
		
		mtpRequest.setAttribute("homeDto", dto);
		com = new PTHomeWriteCommand();
		com.execute(mtpRequest, model);
		return "productManager";
	}
	//pmOrderList
	@RequestMapping("/pmOrderList")
	public String pmOrderList(HttpServletRequest request, Model model) {
		System.out.println("pm orderList request");
		com = new PMOrderListCommand();
		com.execute(request, model);
		return "pmOrderList";
	}
	//orderDetails
	@RequestMapping("/pmOrderDetails")
	public String pmOrderDetails(HttpServletRequest request, Model model) {
		System.out.println("pm order details request");
		com = new PmOrderDetailsCommand();
		com.execute(request, model);
		return "pmOrderDetails";
	}
	//searchOrder
	@RequestMapping("/searchOrder")
	public String searchOrder(HttpServletRequest request, Model model) {
		System.out.println("searchOrder request");
		com = new OrderSearchCommand();
		com.execute(request,model);		
		return "searchOrder";
	}
	//opState변경
	@RequestMapping(value="/opStateModify", produces="application/text;charset=UTF8")
	public String opStateModify(HttpServletRequest request, Model model) {
		System.out.println("order state modify request");
		com = new PmOrderStateModifyCommand();
		com.execute(request, model);
		com = new PMOrderListCommand();
		com.execute(request, model);
		return "pmOrderList";
	}
	//managerHelp
	@RequestMapping("/managerHelp")
	public String managerHelp() {
		System.out.println("managerHelp request");
		return "managerHelp";
	}
	//pageInfo
	@RequestMapping("/pageInfo")
	public String pageInfo() {
		System.out.println("pageInfo request");
		return "pageInfo";
	}
	//page information request
	
	@RequestMapping(value="/productCurrent", produces="application/json; charset=UTF8")
	@ResponseBody
	public JSONObject productCurrent(HttpServletRequest request, Model model) {
		System.out.println("productCurrent 요청");
		String subcmd = request.getParameter("subcmd");
		System.out.println("subcmd: " + subcmd);
		com = new ProductCurrentCommand();
		com.execute(request, model);
		
		HashMap<String, Object> dashMap = (HashMap<String, Object>)model.asMap();
		ArrayList<ProductCurrentGraphDto> dashList = (ArrayList<ProductCurrentGraphDto>)dashMap.get("productCurrentList");
		
		JSONArray dashArr = new JSONArray();
		for(ProductCurrentGraphDto dto:dashList) {
			JSONObject data = new JSONObject();
			data.put("pType", dto.getpType());
			data.put("pView", dto.getViews());
			data.put("pQuanty", dto.getQuanty());
			dashArr.add(data);
		}
		JSONObject result = new JSONObject();
		result.put("datas", dashArr);
		return result;
	}
	@RequestMapping("/pageInfo_OrderState")
	public String pageInfo_OrderState() {
		System.out.println("pageInfo_OrderState request");
		return "pageInfo_OrderState";
	}
	@RequestMapping(value="/orderStateCurrent", produces="application/json;charset=UTF8")
	@ResponseBody
	public JSONObject orderStateCurrent(HttpServletRequest request, Model model) {
		System.out.println("orderStateCurrent request");
		com = new OrderStateCurrentCommand();
		com.execute(request, model);
		HashMap<String, Object> dashMap = (HashMap<String, Object>)model.asMap();
		ArrayList<OrderStateCurrentGraphDto> dashList = (ArrayList<OrderStateCurrentGraphDto>)dashMap.get("orderStateCurrentList");
		
		JSONArray dashArr = new JSONArray();
		for(OrderStateCurrentGraphDto dto:dashList) {
			JSONObject data = new JSONObject();
			data.put("opState", dto.getOpState());
			data.put("opQuanty", dto.getOpQuanty());
			dashArr.add(data);
		}
		JSONObject result = new JSONObject();
		result.put("datas", dashArr);
		return result;
	}
	@RequestMapping("/pageInfo_MonthlyOrder")
	public String pageInfo_MonthlyOrder() {
		System.out.println("pageInfo_MonthlyOrder request");
		return "pageInfo_MonthlyOrder";
	}
	@RequestMapping(value="/monthlyOrderCurrent", produces="application/json;charset=UTF8")
	@ResponseBody
	public JSONObject monthlyOrderCurrent(HttpServletRequest request, Model model) {
		System.out.println("monthlyOrderCurrent request");
		com = new MonthlyOrderCommand();
		com.execute(request, model);
		HashMap<String, Object> dashMap = (HashMap<String, Object>)model.asMap();
		ArrayList<MonthlyOrderDto> dashList = (ArrayList<MonthlyOrderDto>)dashMap.get("monthlyOrderList");
		
		JSONArray dashArr = new JSONArray();
		for(MonthlyOrderDto dto : dashList) {
			JSONObject data = new JSONObject();
			data.put("monthlyData", dto.getMonthlyData());
			data.put("orders", dto.getOrders());
			dashArr.add(data);
		}
		JSONObject result = new JSONObject();
		result.put("datas", dashArr);
		return result;
	}
	@RequestMapping("/pageInfo_MonthlyComplete")
	public String pageInfo_MonthlyComplete() {
		System.out.println("pageInfo_MonthlyComplete request");
		return "pageInfo_MonthlyComplete";
	}
	@RequestMapping(value="/monthlyCompleteCurrent", produces="application/json;charset=UTF8")
	@ResponseBody
	public JSONObject monthlyCompleteCurrent(HttpServletRequest request, Model model) {
		System.out.println("monthlyCompleteCurrent request");
		com = new MonthlyCompleteCommand();
		com.execute(request, model);
		HashMap<String, Object> dashMap = (HashMap<String, Object>)model.asMap();
		ArrayList<MonthlyOrderDto> dashList = (ArrayList<MonthlyOrderDto>)dashMap.get("monthlyCompleteList");
		
		JSONArray dashArr = new JSONArray();
		for(MonthlyOrderDto dto : dashList) {
			JSONObject data = new JSONObject();
			data.put("monthlyData", dto.getMonthlyData());
			data.put("orders", dto.getOrders());
			dashArr.add(data);
		}
		JSONObject result = new JSONObject();
		result.put("datas", dashArr);
		return result;
	}

}
