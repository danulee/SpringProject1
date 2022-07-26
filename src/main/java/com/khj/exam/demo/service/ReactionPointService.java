package com.khj.exam.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.khj.exam.demo.repository.ArticleRepository;
import com.khj.exam.demo.repository.ReactionPointRepository;
import com.khj.exam.demo.utill.Ut;
import com.khj.exam.demo.vo.Article;
import com.khj.exam.demo.vo.ResultData;

@Service
public class ReactionPointService {
	private ReactionPointRepository reactionPointRepository;

	public ReactionPointService(ReactionPointRepository reactionPointRepository) {
		this.reactionPointRepository = reactionPointRepository;
	}


	public boolean actorCanMackReactionPoint(int actorId, String relTypeCode, int id) {
		if (actorId == 0) {
			return false;
		}

		return reactionPointRepository.actorCanMackReactionPoint(id, relTypeCode, actorId) == 0;
	}

}