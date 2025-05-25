# 🔗 Ethereum Simple Wallet

一个基于 Truffle 和 Ganache 的简单以太坊钱包智能合约项目，包含完整的 Web 界面用于测试合约功能。

## 📋 项目概述

这是一个学习型的以太坊 DApp 项目，实现了一个简单的钱包合约，支持：
- 存款和取款功能
- 余额查询
- 事件监听
- 完整的 Web 前端界面

## 🚀 功能特性

### 智能合约功能
- **sayHello()** - 返回问候语
- **deposit()** - 存款功能，支持以太币存入
- **Withdraw(uint256 _amount)** - 取款功能
- **balances(address)** - 查询指定地址余额
- **getContractBalance()** - 获取合约总余额
- **事件监听** - Deposited 和 Withdrawn 事件

### Web 界面功能
- 🔗 MetaMask 连接管理
- 💰 实时余额显示
- 💸 存款/取款操作
- 📊 交易状态跟踪
- 📡 实时事件监听
- 📱 响应式设计

## 🛠 技术栈

- **智能合约**: Solidity ^0.8.19
- **开发框架**: Truffle
- **本地区块链**: Ganache
- **前端**: HTML5 + CSS3 + JavaScript
- **区块链交互**: ethers.js v6
- **UI库**: jQuery
- **钱包**: MetaMask

## 📦 项目结构

```
my-dapp/
├── contracts/                 # 智能合约
│   └── SimpleStorage.sol     # 主合约文件
├── migrations/               # 部署脚本
│   ├── 1_initial_migration.js
│   └── 2_deploy_contracts.js
├── test/                     # 测试文件
├── build/                    # 编译后的合约
├── test.html                 # Web测试界面
├── truffle-config.js         # Truffle配置
└── README.md                 # 项目说明
```

## 🔧 安装与设置

### 1. 环境要求

- Node.js >= 16.0.0
- npm 或 yarn
- Git

### 2. 安装依赖

```bash
# 克隆项目
git clone https://github.com/wceozl/ethereum-simple-wallet.git
cd ethereum-simple-wallet

# 全局安装 Truffle
npm install -g truffle

# 安装 Ganache (可选择GUI版本或CLI版本)
npm install -g ganache-cli
# 或下载 Ganache GUI: https://trufflesuite.com/ganache/
```

### 3. 启动本地区块链

```bash
# 启动 Ganache CLI
ganache-cli -p 7545

# 或启动 Ganache GUI (推荐)
# 配置: 端口 7545, 网络ID 5777
```

### 4. 编译和部署合约

```bash
# 编译合约
truffle compile

# 部署到本地网络
truffle migrate --network development

# 重新部署 (如果需要)
truffle migrate --reset --network development
```

### 5. 配置 MetaMask

1. 安装 [MetaMask 浏览器扩展](https://metamask.io/)
2. 添加本地网络:
   - 网络名称: `Local Ganache`
   - RPC URL: `http://127.0.0.1:7545`
   - 链 ID: `1337` (或根据 Ganache 配置)
   - 货币符号: `ETH`
3. 导入 Ganache 提供的测试账户私钥

## 🎮 使用指南

### 启动 Web 界面

1. **启动本地服务器** (推荐，避免 CORS 问题):
   ```bash
   # 使用 Python
   python -m http.server 8080
   
   # 或使用 Node.js
   npx http-server
   ```

2. **打开浏览器**: 访问 `http://localhost:8080/test.html`

### 操作流程

1. **连接钱包**: 点击 "连接MetaMask" 按钮
2. **合约交互**: 
   - 调用 `sayHello()` 测试连接
   - 存入一些 ETH 到合约
   - 查询余额
   - 取出 ETH
3. **事件监听**: 开启事件监听查看实时交易

### Truffle 控制台交互

```bash
# 启动 Truffle 控制台
truffle console --network development

# 获取合约实例
let wallet = await SimpleWallet.deployed()

# 调用合约方法
let greeting = await wallet.sayHello()
console.log(greeting)

# 存款 1 ETH
let accounts = await web3.eth.getAccounts()
await wallet.deposit({from: accounts[0], value: web3.utils.toWei('1', 'ether')})

# 查询余额
let balance = await wallet.balances(accounts[0])
console.log(web3.utils.fromWei(balance.toString(), 'ether'))
```

## 🧪 测试

```bash
# 运行测试 (如果有测试文件)
truffle test

# 在特定网络上测试
truffle test --network development
```

## 📸 界面截图

Web 界面包含以下功能区域：
- 📊 连接状态和账户信息
- 📋 合约信息显示
- 📖 只读方法调用
- ✍️ 写入方法操作
- 📡 事件监听面板

## ⚠️ 注意事项

1. **仅用于学习**: 此项目仅用于学习目的，不应在主网使用
2. **私钥安全**: 不要在生产环境使用 Ganache 生成的私钥
3. **网络匹配**: 确保 MetaMask 连接到正确的本地网络
4. **Gas 费用**: 本地测试网络的 Gas 费用是模拟的

## 🐛 常见问题

### Q: MetaMask 连接失败？
**A**: 检查网络配置，确保端口和链 ID 匹配

### Q: 合约调用失败？
**A**: 确保 Ganache 运行中，并且合约已正确部署

### Q: 交易一直 pending？
**A**: 检查 Gas 设置，可能需要增加 Gas Limit

### Q: 页面显示"请先加载合约"？
**A**: 检查合约地址是否正确，或点击"手动加载合约"按钮

## 🤝 贡献指南

欢迎提交 Issue 和 Pull Request！

1. Fork 项目
2. 创建功能分支: `git checkout -b feature/your-feature`
3. 提交更改: `git commit -am 'Add some feature'`
4. 推送分支: `git push origin feature/your-feature`
5. 提交 Pull Request

## 📄 许可证

此项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情

## 🔗 相关链接

- [Truffle 文档](https://trufflesuite.com/docs/)
- [Ganache 文档](https://trufflesuite.com/ganache/)
- [Solidity 文档](https://docs.soliditylang.org/)
- [ethers.js 文档](https://docs.ethers.org/)
- [MetaMask 文档](https://docs.metamask.io/)

## 🙏 致谢

感谢所有开源项目的贡献者，特别是 Truffle Suite 和 ethers.js 团队。

---

**Happy Coding! 🚀**