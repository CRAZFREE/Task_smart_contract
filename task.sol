pragma solidity ^0.5.0;
contract task{
    uint public taskcount=0;
    struct Task{
        uint id;
        string t;
        bool valid;
    }
    constructor(bool valid) public {
        valid =false;
    }
    
    mapping(uint=>Task) public tasks;
    event taskCreated(uint id,string t,bool valid);
    event taskcompleted(uint id,bool valid);
    function createTask(string memory _t) public{
        taskcount++;
        tasks[taskcount]=Task(taskcount,_t,false);
        emit taskCreated(taskcount,_t,false);
    }
    function updateTask(uint _id) public{
        Task memory _task =tasks[_id];
        _task.valid=!_task.valid;
        tasks[_id]=_task;
        emit taskcompleted(_id,_task.valid);
    }
    
}