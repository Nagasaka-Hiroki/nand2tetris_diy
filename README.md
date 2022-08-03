# コンピュータシステムの理論と実装を読む
### (The Element of Computing System)
　コンピュータシステムの理論と実装を読みつつ、各章末尾のプロジェクト（課題？）の回答をしていく。ゆっくりになると思われるが焦らず確実に進めたい。  
この本は、2021年にsecond editionが発売されている。そのためもしかすれば近いうちに日本語版が出版されるかもしれない（本を買ってから知った…。）。  

この本を読もうと思ったきっかけはおおよそ以下のブログを読んだからである。  
> - [低レイヤーを学ぶための技術書をまとめてみる](https://qiita.com/hareku/items/3383be7aee616e04b80f)  

CPUの周りのことについて知りたいと思い読み始めた。

また、検索すると当たり前であるが、すでに先駆者の方がすでにプロジェクトについての回答をGitHubにアップロードしている。  
簡単に探した範囲でも以下の方が見つかった。  
> - [https://github.com/itzhak-razi/the-elements-of-computing-systems](https://github.com/itzhak-razi/the-elements-of-computing-systems)
> - [https://github.com/ikenox/nand2tetris](https://github.com/ikenox/nand2tetris)  
> - [https://github.com/ackintosh/nand2tetris](https://github.com/ackintosh/nand2tetris)  

ほかにもたくさんおられると思うが、先駆者を探すことが目的ではないためここまでとす。あくまで本を読んで学習することが目的なので。  
先駆者のリポジトリを参照するのは、先人のリポジトリがどうなっているかやどう作っているかを参考にするためである。  
（ライセンスがどうなっているかとか特に心配なので）  

## 学習環境の準備
　念のため学習の環境についてメモする。  

### 環境
　使用しているOSやエディタについてメモする。

|OSおよびエディタ|環境|
|--------|-----------|
|ホストOS |Windows 10 Home|
|ゲストOS |Ubuntu 20.04.4 LTS (wsl2)|
|エディタ |Visual Studio Code|

エディタは主としてVisual Studio Codeを使用するが、簡単なシェルスクリプトを作る際などにはVimを使用する。  
wsl2を使用する理由は、gitを普段wsl2上で使っている関係上、管理をしやすくするのが目的であるため本質的には意味はない。  
しかし、コンピュータシステムの理論と実装が提供してくれるフリーソフトはGUIアプリケーションなので、wsl上からGUIアプリを使えるように設定しなければならないと思う。  

### フリーソフトの入手とセットアップ
　コンピュータシステムの理論と実装の本家のサイト
> - [コンピュータシステムの理論と実装](https://www.oreilly.co.jp/books/9784873117126/)

にダウンロードサイトへのリンクがある。リンクは以下の通り
> - [https://www.nand2tetris.org/software](https://www.nand2tetris.org/software)

このページからソフトウェアをダウンロードしてzipファイルを展開する。この展開はWindows側で行った。  
この段階で、
1. Windows上で動くか？
2. wsl上で動くか？

を確認した。  

1. Windows上で動くか？

    これはすぐ確認できた。第一章を読み終えていたので、まず```HardwareSimulator.bat```をダブルクリックすれば起動した。おそらくこれで大丈夫なはず。

2. wsl上で動くか？

    こちらも特に問題なく起動した。windows側のエクスプローラで```HardwareSimulator.sh```があるフォルダを探し、wslで開いて```bash HardwareSimulator.sh```とすれば同様に起動した。

前述の通り、作業はwsl側で行うため2の方法でプログラムを起動する。そのためファイルをwsl側にコピーしておく。  

本家のサイトによれば上記の内容だけでは準備が不十分らしい。  
> - [https://www.nand2tetris.org/software](https://www.nand2tetris.org/software)  
Running the Software Tools  
Mac and Linux users:

こちらの項目によれば、プログラムをコマンド化して任意のディレクトリ上で実行できるようにすることが書かれている。ひとまずしたがって作業する。  
（文章の内容的にはいちいち.shって入力するの面倒だろ？くらいの内容なのだろうか？）  

公式の内容ではシェルスクリプトのリンボリックリンクを ```/bin```に作成することが書かれている。しかし以下のブログを読んだところ、自分でダウンロードしてきたプログラムは```/usr/local/bin```にリンクを貼るのが良い？らしい。
> - [/bin, /usr/bin, /usr/sbin, /usr/local/bin の違いとは？](https://qiita.com/valzer0/items/67a4c8bf2b1be0fc825a)  

そのため以下のコマンドを実行する。
```
    cd /usr/local/bin
    sudo ln -s /path to HardwareSimulator.sh/HardwareSimulator.sh HardwareSimulator
```
```/path to HardwareSimulator.sh/```はダウンロードしたファイルを保存している場所からコマンド化したいスクリプトが保存されているディレクトリまでのパスを表す。  
本家のサイトによれば、上記コマンドに加えて```chmod +x HardwareSimulator```と書いているが、なぜか私がファイルをダウンロードした段階、リンクを作成した段階ですでにパーミッションが```lrwxrwxrwx```になっている。そのため追加でパーミッションを設定する必要はないと思うのでこれは実行しなかった。

上記コマンドを実行したのちに、
```
    HardwareSimulator
```
とコンソールに入力して実行した結果、問題なくプログラムを起動することができた。  

学習が進むにつれて扱うツールの種類が増えていくと思うが、上記方法と同じ方法で追加していこうと思う。
