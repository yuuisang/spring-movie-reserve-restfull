package com.goldspoon.koreabox;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goldspoon.koreabox.movie.service.Common;
import com.goldspoon.koreabox.user.beans.UserDAO;
import com.goldspoon.koreabox.user.beans.UserDTO;
import com.goldspoon.koreabox.user.command.IdSearchCommand;
import com.goldspoon.koreabox.user.command.LoginCommand;
import com.goldspoon.koreabox.user.command.SignUpCommand;
import com.goldspoon.koreabox.email.Email;
import com.goldspoon.koreabox.email.EmailSender;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
   
   // MyBatis
   private SqlSession sqlSession;
   
      @Autowired
       private EmailSender emailSender;
       @Autowired
       private Email email;
   
   @Autowired
   public void setSqlSession(SqlSession sqlSession) {
      this.sqlSession = sqlSession;
      Common.sqlSession = sqlSession;
   }
       

   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
   /**
    * Simply selects the home view to render by returning its name.
    */
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model) {
      logger.info("Welcome home! The client locale is {}.", locale);
      
      Date date = new Date();
      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
      
      String formattedDate = dateFormat.format(date);
      
      model.addAttribute("serverTime", formattedDate );
      
      return "index";
   }
   


   


   @RequestMapping("/login")
   public void login() {
      
   }
   
   @RequestMapping("/loginOk")
   public void loginOk(HttpServletRequest request, Model model, String mem_id, String mem_pw) {
      model.addAttribute("mem_id", mem_id);
      model.addAttribute("mem_pw", mem_pw);
//      new LoginCommand().execute(model);
      new LoginCommand().loginSession(request, model);
   }
   
   @RequestMapping("/logOut")
   public void logOut() {
      
   }
   
   @RequestMapping("/signUp")
   public void signUp() {
   }
   
   @RequestMapping("/signUpOkPage")
   public void signUpOkPage(Model model, UserDTO dto, String pwOk) {
      model.addAttribute("dto", dto);   //command 파일로 dto 보내기
      model.addAttribute("pwOk", pwOk);
      new SignUpCommand().execute(model);
   }
   
   
   @RequestMapping("/idpwSearch")
   public void idpwSearch() {
      
      
   }
   
   @RequestMapping("/idSearchOk")
   public void idSearchOk(Model model, String mem_name, String mem_phone) {
      model.addAttribute("mem_name", mem_name);
      model.addAttribute("mem_phone", mem_phone);
      new IdSearchCommand().execute(model);
      
   }
   
//   @RequestMapping("/pwSearchOk")
//   public void idSearchOk(Model model, String mem_id, String mem_name, String mem_email) {
//      model.addAttribute("mem_id", mem_id);
//      model.addAttribute("mem_name", mem_name);
//      model.addAttribute("mem_email", mem_email);
//      new PwSearchCommand().execute(model);
//      String mem_pw = (String)model.getAttribute("mem_pw");
//      
//      
//   }
   
    @RequestMapping("/pwSearchFail")
    public void pwSearchOk() {
       
    }
    
    @RequestMapping("/pwSearchPage")
    public void pwSearchPage() {
       
    }

   
    @RequestMapping("/pwSearchOk")
    public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
       ModelAndView mav;
       
      String id = (String) paramMap.get("mem_id");
      String name = (String) paramMap.get("mem_name");
      String mem_email = (String) paramMap.get("mem_email");
      String mem_pw = "";
      int result = 0;
      
      System.out.println("id : " + id);
      System.out.println("name : " + name);
      System.out.println("mem_email : " + mem_email);
      UserDAO dao = Common.sqlSession.getMapper(UserDAO.class);
      
      mem_pw = dao.pwSearch(id, name, mem_email);
      if(mem_pw==null) {
         result = 0;
         System.out.println("mem_pw : " + mem_pw);
         System.out.println("result : " + result);
      }else {
         result = 1;
         System.out.println("result : " + result);
      }
      
       
      String pw = mem_pw;
      
        System.out.println(pw);
        
        if(pw!=null) {
            email.setContent("비밀번호는 "+pw+" 입니다.");
            System.out.println(email.getContent().toString());
            email.setReceiver(mem_email);
            System.out.println(email.getReceiver().toString());
            email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
            System.out.println(email.getSubject().toString());
            emailSender.SendEmail(email);
            mav= new ModelAndView("redirect:/pwSearchPage");
            return mav;
        }else {
            mav=new ModelAndView("redirect:/pwSearchFail");
            return mav;
        }
    }
   
    @RequestMapping("/secession")
    public void secession() {
       
    }
    

   
//    @RequestMapping("/pwSearchOk")
//    public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
//        ModelAndView mav;
//        String id=(String) paramMap.get("id");
//        String e_mail=(String) paramMap.get("email");
////        String pw=mainService.getPw(paramMap);
//        String pw= 
//        System.out.println(pw);
//        if(pw!=null) {
//            email.setContent("비밀번호는 "+pw+" 입니다.");
//            email.setReceiver(e_mail);
//            email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
//            emailSender.SendEmail(email);
//            mav= new ModelAndView("redirect:/login.do");
//            return mav;
//        }else {
//            mav=new ModelAndView("redirect:/logout.do");
//            return mav;
//        }
//    }
    

}

