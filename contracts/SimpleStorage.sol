// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// 定义合约
contract SimpleWallet {
    // hello world 方法
    // string memory 字符串类型，memory表示储存在内存里，执行完就释放
    // public 可以从合约内部、外部以及通过继承的合约调用
    // pure 该函数不读取也不修改合约
    function sayHello() public pure returns (string memory) {
        return "Hello World";
    }

    // 2. 储存余额
    // mapping 是一种键值对储存结构，键是address类型，值是uint，这里将地址映射到其他额（无符号整数）
    // public会自动创建一个getter函数，方便查询余额
    // address 以太坊账户地址类型
    // uint 无符号整数类型
    mapping(address => uint256) public balances;
    // 定义事件，当有存款或取款时触发，方便链下应用监听
    // 事件可以接收参数（索引地址，和传递的额），也可以不用任何参数
    // indexed关键字允许按该参数进行过滤搜索
    event Deposited(address indexed account, uint256 amount);
    event Withdrawn(address indexed account, uint256 amount);

    // 3.存款功能
    // payable关键字允许这个函数接受以太币,当调用payable函数时，msg.value会包含发送的ether数量
    function deposit() public payable {
        // msg.sender 是调用此函数的账户地址，全局变量
        // msg.value 是调用函数发送的以太币数量（单位为wei），全局变量
        // require 用于检查条件，如果条件为false，交易会回滚，并返回错误信息
        require(msg.value > 0, "deposit amout must be greater than 0");

        balances[msg.sender] = balances[msg.sender] + msg.value;
        // emit 触发一个事件
        emit Deposited(msg.sender, msg.value);
    }

    // 4.取款功能
    function Withdraw(uint256 _amount) public {
        // 检查调用者是否有足够的余额
        require(balances[msg.sender] >= _amount, "Infufficient balance");
        // 检查取款金额是否大于0
        require(_amount > 0, "Withdrawal amount must be positive");
        // 更新余额(遵循'Check-Effects-Interactions'模式，先修改状态)
        balances[msg.sender] = balances[msg.sender] - _amount;
        // 发送以太币给调用者
        // payable(address).call{value:amount}(""; 这是当前推荐的另一种像一个地址发送Ether的方法，它比.transfer()或.send()更安全，因为他们有固定的gas limit，可能导致在某些情况下失败。call会转发所有可用的gas。
        (bool sent, ) = payable(msg.sender).call{value: _amount}("");
        require(sent, "Failed to send Ether");
        emit Withdrawn(msg.sender, _amount);
    }

    // 5.获取合约当前总余额
    // view表示该函数读取合约状态，但不修改
    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }
}
