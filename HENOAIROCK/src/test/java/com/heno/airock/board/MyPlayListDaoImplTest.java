package com.heno.airock.board;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.After;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.heno.airock.dao.MyPlaylistDao;
import com.heno.airock.dao.MyPlayListDaoImpl;
import com.heno.airock.dto.MyPlayListVO;

@RunWith(SpringJUnit4ClassRunner.class) // 스프링 테스트 컨택스트 프레임워크의 JUnit 확장 기능 지정
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // @Test 메서드를 오름차순으로 정렬한 순서대로 실행
public class MyPlayListDaoImplTest {

	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	MyPlaylistDao dao;
	
	MyPlayListVO myplaylistVO;

	MyPlayListVO myplaylistVO1;
	MyPlayListVO myplaylistVO2;
	MyPlayListVO myplaylistVO3;
	MyPlayListVO myplaylistVO4;
	MyPlayListVO myplaylistVO5;
	
	
	@Before
	public void setUp() throws Exception {
		LOG.debug("*************************");
		LOG.debug("*test 시작~~~~~**");
		LOG.debug("*************************");
		
		assertNotNull(dao);
		
		myplaylistVO = new MyPlayListVO();
		myplaylistVO.setUserId("procss2696@gmail.com");
		myplaylistVO.setFeeling("신남");
		
//		myplaylistVO1 = new MyPlayListVO("Super Shy","NewJeans","NewJeans 2nd EP 'Get Up'","신남");
//		myplaylistVO2 = new MyPlayListVO("Seven (feat. Latto) - Clean Ver.","정국","Seven (feat. Latto) - Clean Ver.","신남");
//		myplaylistVO3 = new MyPlayListVO("ETA","NewJeans","NewJeans 2nd EP 'Get Up'","신남");
//		myplaylistVO4 = new MyPlayListVO("퀸카 (Queencard)","(여자)아이들","I feel","신남");
//		myplaylistVO5 = new MyPlayListVO("I AM","IVE (아이브)","I've IVE","신남");

	}
	
	@Test
	@Ignore
	public void showPlayList() throws SQLException{
		LOG.debug("=====================");
		LOG.debug("=showPlayList()==");
		LOG.debug("=====================");
		
		List<MyPlayListVO> list = dao.showPlayList(myplaylistVO);
	    LOG.debug("List: " + list); // list 변수를 출력하여 확인
	    for (MyPlayListVO item : list) {
	        LOG.debug(item);
	    }

//		for (MyPlayListVO item : list) {
//			isSameData(item,myplaylistVO1);
//			isSameData(item,myplaylistVO2);
//			isSameData(item,myplaylistVO3);
//			isSameData(item,myplaylistVO4);
//			isSameData(item,myplaylistVO5);
//
//		}
		
		assertEquals(list.size(), 5);

	}
	
	@Test
	public void showPlayLists() throws SQLException{
		LOG.debug("=====================");
		LOG.debug("=showPlayLists()==");
		LOG.debug("=====================");
		
		List<MyPlayListVO> list = dao.showPlayLists(myplaylistVO);
	    for (MyPlayListVO item : list) {
	        LOG.debug(item);
	    }

//		for (MyPlayListVO item : list) {
//			isSameData(item,myplaylistVO1);
//			isSameData(item,myplaylistVO2);
//			isSameData(item,myplaylistVO3);
//			isSameData(item,myplaylistVO4);
//			isSameData(item,myplaylistVO5);
//
//		}
		
		assertEquals(list.size(), 10);

	}
	
	private void isSameData(MyPlayListVO outVO01,MyPlayListVO board01) {
		assertEquals(outVO01.getTitle(), board01.getTitle());
		assertEquals(outVO01.getArtist(), board01.getArtist());
		assertEquals(outVO01.getAlbumImg(), board01.getAlbumImg());
		assertEquals(outVO01.getFeeling(), board01.getFeeling());
	}	
	
	@After
	public void tearDown() {
		LOG.debug("--------------");
		LOG.debug("-tearDown-");
		LOG.debug("--------------");
	}

}
