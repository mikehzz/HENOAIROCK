package com.heno.airock.service;

import org.springframework.stereotype.Service;

import com.heno.airock.dto.PostDTO;
import com.heno.airock.member.repository.PostRepository;

@Service
public class PostService {
	
	private final PostRepository postRepository;
    
    public PostService(PostRepository postRepository) {
        this.postRepository = postRepository;
    }
    
    public int save(PostDTO postDTO) {
    	return postRepository.save(postDTO);
    }
    
    public int delete(PostDTO postDTO) {
    	return postRepository.delete(postDTO);
    }
    
    public int update(PostDTO postDTO) {
    	return postRepository.update(postDTO);
    }
}
