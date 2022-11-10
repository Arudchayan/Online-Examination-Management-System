package com.student.dao;

import java.util.List;

import com.student.model.Feedback;

public interface FeedbackDaoInterface {
	 public Feedback insertFeedback(String sid,String examID,String subject,String content);
     public List<Feedback> getFeedback(String sid);
     public Feedback deleteFeedback(int mid) ;
}
