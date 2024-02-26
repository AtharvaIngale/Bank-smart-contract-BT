pragma solidity^0.6.0;

contract banking{
    mapping(address => uint) public balances;

    function deposit() public payable
    {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public payable returns (string memory){
        require(balances[msg.sender] >= amount, "not enough ether");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        return "Withdrawn Successfully";
    }

    function getBal() public view returns(uint){
        return address(this).balance;
    }
}
