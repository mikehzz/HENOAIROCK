package com.heno.airock.board;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.SQLException;

import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.heno.airock.cmn.PcwkLoger;
import com.heno.airock.dao.CommentDao;
import com.heno.airock.dao.PostDao;
import com.heno.airock.dto.CommentVO;
import com.heno.airock.dto.PostVO;
import com.heno.airock.service.CommentService;
import com.heno.airock.service.PostService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/test-servlet-context.xml"}) // 테스트 컨텍스트가 자동으로 만들어줄
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // @Test 메소드를 오름차순으로 정렬한 순서대로 실행

public class CommentServiceTest implements PcwkLoger{
	
	//save해서 db에 데이터 들어가면 됨
	// jsp랑 controller 작성해서 하면에 띄우면됨
	
	@Autowired
	CommentService service;
	
	@Autowired
	CommentDao dao;
	
	CommentVO board01;
	CommentVO board02;
	CommentVO board03;
	CommentVO board04;
	CommentVO board05;
	
	CommentVO search;
	
	
	@Test
	public void bean() {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│bean                          │");
		LOG.debug("│service                       │"+service);
		LOG.debug("└──────────────────────────────┘");		
		
		assertNotNull(service);
	}

}
