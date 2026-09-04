// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BaseTaskBoard {
    struct Task {
        string text;
        bool completed;
    }

    mapping(address => Task[]) public tasks;

    function addTask(string calldata text) external {
        require(bytes(text).length > 0, "Empty task");

        tasks[msg.sender].push(
            Task({
                text: text,
                completed: false
            })
        );
    }

    function completeTask(uint256 index) external {
        require(index < tasks[msg.sender].length, "Invalid task");

        tasks[msg.sender][index].completed = true;
    }

    function taskCount(address user) external view returns (uint256) {
        return tasks[user].length;
    }
}
