# IPStack

## 第零部分：关于 NEKit-NG，写在最前面

本项目源代码改动自 https://github.com/zhuhaow/NEKit/ 

NEKit 是我最近工作中所严重依赖的开源项目；NEKit 非常成熟，涵盖了开发 macOS/iOS 代理应用
的方方面面，但我们的项目中正好各使用它的其中一部分。为了便于工作的继续开展和新人培训，萌生了
将 NEKit 进行分拆的想法

鉴于原作者在这个领域里开了新坑，似乎并没有在 NEKit 上继续花费太多的精力，而且 NEKit 自从
去年以来也仅仅只有一次 Swift 5.0 的兼容升级。所以冒昧得将新项目取名为 NEKit-NG，同时希望
这个仓库在未来能成为红鱼工作的一个重要基础

预计 NEKit 分拆为 IPStack、ProxyKit、AdapterManager 等三部分；也可能会继续分拆出一
个 ResolverKit

NEKit-NG 基于 Swift 5；采用 Carthage 管理依赖

ProxyKit 是代理应用的核心，理解 NEKit-NG 或者说 NEKit 应该从 ProxyKit 开始。而 IPStack 是比
较基础的数据结构和网络操作库，红鱼的 DNSMaster 仅仅依赖 IPStack，并没有用到 NEKit 绝大多数的
功能；所以把这部分抽出来作为一个独立的库

总结：IPStack 是基础库，DNSMaster 和 ProxyKit 分别依赖于它

## 第一部分：许可协议

NEKit 的许可协议见下。本项目的所有变动也同样置于该许可协议之下发布

Copyright (c) 2016, Zhuhao Wang
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

* Neither the name of NEKit nor the names of its
  contributors may be used to endorse or promote products derived from
  this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

## 第二部分：相比较 NEKit 的改变

所有源代码尽可能从 NEKit 中复制，几个变化的部分包括

* Port 改名为 IPort，因为 Foundation 里面已经有了一个 Port 类型了

* 部分定义改成 public，为了从其它项目中引用

* 假定您在同一个目录下同时 clone 了 NEKit 和 IPStack，可以在 IPStack 目录下执行脚本来对比
  异同：sh script/diff.sh
