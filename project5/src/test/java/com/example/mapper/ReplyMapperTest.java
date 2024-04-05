package com.example.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.mapper.ReplyMapper;

import com.example.domain.Criteria;
import com.example.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { com.example.config.RootConfig.class })
@Log4j
public class ReplyMapperTest {
	//실제 존재하는 게시물번호인지 확인하기
		private Long[] bnoArr= {100L,101L,102L,103L,104L,105L,106L,107L,108L,109L,110L};
		
	    @Setter(onMethod_ = @Autowired)
		private ReplyMapper mapper;
	    
//	    @Test
	    public void testCreate() {
	    	IntStream.rangeClosed(1, 10).forEach(i -> {
	    		ReplyVO vo=new ReplyVO();
	    		vo.setBno(bnoArr[i%5]);
	    		vo.setReply("댓글 테스트"+i);
	    		vo.setReplyer("replyer"+i);
	    		mapper.insert(vo);
	    	});
	    }
	    
//	    @Test
	    public void testRead() {
	    	Long targetRno = 5L;
	    	ReplyVO vo=mapper.read(targetRno);
	    	log.info(vo);
	    }
	    
//	    @Test
	    public void testMapper() {
	    	
	    	log.info(mapper);
	    }
	    
//	    @Test
	    public void testDelete() {
	    	Long targetRno=17L;
	    	mapper.delete(targetRno);
	    }
	    
	    @Test
	    public void testUpdate() {
	    	Long targetRno=100L;
	    	ReplyVO vo=mapper.read(targetRno);
	    	vo.setReply("Update Reply");
	    	int count=mapper.update(vo);
	    	log.info("UPDATE COUNT: "+count);
	    }
	    
//	    @Test
	    public void testList() {
	    	Criteria cri=new Criteria();
	    	
	    	//7L
	    	List<ReplyVO> replies=mapper.getListWithPaging(cri,bnoArr[0]);
	    	replies.forEach(reply->log.info(reply));
	    }
}

