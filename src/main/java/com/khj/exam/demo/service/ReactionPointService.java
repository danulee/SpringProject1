package com.khj.exam.demo.service;

import org.springframework.stereotype.Service;

import com.khj.exam.demo.repository.ReactionPointRepository;

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