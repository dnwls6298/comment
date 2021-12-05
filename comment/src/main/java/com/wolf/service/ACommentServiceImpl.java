package com.wolf.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wolf.dao.ACommentDAO;
import com.wolf.domain.ACommentDTO;
import com.wolf.domain.ACommentPageDTO;

@Service
public class ACommentServiceImpl implements ACommentService{
	
	@Inject
	private ACommentDAO ACommentDAO;

	@Override
	public List<ACommentDTO> getcomments(ACommentPageDTO PageDTO) {
		return ACommentDAO.getcomments(PageDTO);
	}

	@Override
	public int getcommentCount() {
		return ACommentDAO.getcommentCount();
	}

	@Override
	public void insertcomment(ACommentDTO ACommentdto) {
		
		Timestamp date = new Timestamp(System.currentTimeMillis());
		ACommentdto.setCommentTime(date);
		
		ACommentDAO.insertcomment(ACommentdto);
	}

	@Override
	public List<ACommentDTO> getrecomments(ACommentPageDTO PageDTO) {
		return ACommentDAO.getrecomments(PageDTO);
	}

	@Override
	public int getrecommentCount(ACommentPageDTO PageDTO) {
		return ACommentDAO.getrecommentCount(PageDTO);
	}

	@Override
	public void insertRecomment(ACommentDTO ACommentdto) {
		
		Timestamp date = new Timestamp(System.currentTimeMillis());
		ACommentdto.setCommentTime(date);
		
		ACommentDAO.insertRecomment(ACommentdto);
	}

	@Override
	public void insertPiture(ACommentDTO ACommentdto) {
		ACommentDAO.insertPiture(ACommentdto);
		
	}

	@Override
	public List<ACommentDTO> checkcomment(ACommentDTO ACommentdto) {
		return ACommentDAO.checkcomment(ACommentdto);
	}

	@Override
	public String deleteComment(int commentNum) {
		return ACommentDAO.deleteComment(commentNum);
	}

	@Override
	public List<ACommentDTO> checkrecomment(ACommentDTO ACommentdto) {
		return ACommentDAO.checkrecomment(ACommentdto);
	}

	@Override
	public void deleteRecomment(int commentNum) {
		ACommentDAO.deleteComment(commentNum);
	}

	@Override
	public String updateComment(ACommentDTO ACommentdto) {
		return ACommentDAO.updateComment(ACommentdto);
	}

	@Override
	public void deleteFile(String filename) {
		ACommentDAO.deleteFile(filename);
	}

	@Override
	public void updateFilename(String picture) {
		ACommentDAO.updateFilename(picture);
	}

	@Override
	public void updateRecomment(ACommentDTO ACommentdto) {
		ACommentDAO.updateRecomment(ACommentdto);
	}

}