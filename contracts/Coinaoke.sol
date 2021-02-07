// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;

contract Coinaoke {

  struct Submission {
    string url;
    address owner; 
  }

  struct Vote {
    uint index;
    address voter;
  }

  struct Contest {
    Submission[2] submissions;
    Vote[] votes;
  }

  Contest[] contests;
  uint contestsLength = contests.length;

  function getContestToVoteOn() public view returns (uint contestId) {
    for (uint i = 0; i < contestsLength; i++) {
      if (contests[i].votes.length < 1) {
        return contestId;
      }
    }
    require (false, "No challenges to vote on currently");
  }

  function vote(uint selection, uint contestId) public {
    require(contests.length > contestId, "Contest doesn't exist");
    uint currentVotes = contests[contestId].votes.length;
    contests[contestId].votes[currentVotes].index = selection;
    contests[contestId].votes[currentVotes].voter = msg.sender;
  }
}
