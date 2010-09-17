" Presentation Object
let s:Presentation = { 'slides' : [], 'current' : 0, 'currentLine' : 0 }

function! s:Presentation.load()
  let self.slides = [
        \ {
        \   'title' : '今日はvimでプレゼンします',
        \   'contents' : [
        \     '* set columns, linesの調整します',
        \     '* Command = で大きく',
        \   ]
        \ },
        \ {
        \   'title' : '注意事項',
        \   'contents' : [
        \     '* Do not twit this contents.',
        \   ]
        \ },
        \ {
        \   'title' : 'Y!Japan の品質管理 - Agenda',
        \   'contents' : [
        \     '* 事故とは何か',
        \     '* 処理フローについて',
        \     '* どう防ぐか(技術例)',
        \   ]
        \ },
        \ {
        \   'title' : '事故とは',
        \   'contents' : [
        \     '* Yahoo!JAPANのイメージを悪くするようなことすべて',
        \   ]
        \ },
        \ {
        \   'title' : '事故の例',
        \   'contents' : [
        \     '* パートナーへの入金漏れ',
        \     '* Y!メールの不達',
        \     '* Y!トップの表示崩れ',
        \     '* 検索結果が403とか',
        \     '* HolyGrailは？(かなり微妙なライン)',
        \     '** twitterで社内情報もらしまくり',
        \     '** hatenaであばりまくり',
        \   ]
        \ },
        \ {
        \   'title' : 'Yahoo!トップの表示崩れの場合',
        \   'contents' : [
        \     'エンジニア',
        \     '* とりあえずスナップショットでもとっとくか',
        \     '* reblogしとくか',
        \     'Yahoo!JAPANのユーザ',
        \     '* インターネットが壊れた？',
        \     '* インフラが壊れるなんて！',
        \   ]
        \ },
        \ {
        \   'title' : '事故判定された場合の対応',
        \   'contents' : [
        \     '* 発見から報告',
        \     '** 発生後、1時間以内に報告されないとペナルティ',
        \     '* 報告から応急処置',
        \     '** 24時間以内に応急処置を完了しないとペナルティ',
        \     '* 応急処置から再発防止策',
        \     '** 1ヶ月以内に再発防止策を提示・実施しないとペナルティ',
        \   ]
        \ },
        \ {
        \   'title' : '事故の例',
        \   'contents' : [
        \     '1. 報告',
        \     '** メールで報告する',
        \     '** Yahoo!グループのPC用Webサイトがたまに見れません。',
        \   ]
        \ },
        \ {
        \   'title' : '事故の例',
        \   'contents' : [
        \     '2. 応急処置',
        \     '** 原因究明、特定、修正',
        \     '** アップデートしたパッケージにバグが混入',
        \     '** →正常だったときのパッケージまでロールバック',
        \   ]
        \ },
        \ {
        \   'title' : '事故の例',
        \   'contents' : [
        \     '3. 再発防止策',
        \     '** 2度と同じ事故が起こらないために',
        \     '** バグが発生しても事故にならないように',
        \     '** バグ修正は再発防止策にならない',
        \     '** →テスト方法の充実化',
        \   ]
        \ },
        \ {
        \   'title' : '技術的な話',
        \   'contents' : [
        \     '* 開発者がどうやって事故を防ぐか',
        \     '** 基本は冗長化',
        \     '** →サーバが死んでもサービスは死なない',
        \     '** →この点では日本一ではあるまいか',
        \   ]
        \ },
        \ {
        \   'title' : '冗長化の例',
        \   'contents' : [
        \     '* DNSラウンドロビン',
        \     '* VIP',
        \     '* MySQLのレプリケーション',
        \     '* shmproxy',
        \     '* yfor',
        \   ]
        \ },
        \ {
        \   'title' : 'DNSラウンドロビン',
        \   'contents' : [
        \     '* 同じドメインに対して複数のIPを登録',
        \     '** 特殊な機器もプログラムの変更もなしに負荷を分散できる',
        \     '** 壊れたサーバにも均等にアクセス',
        \   ]
        \ },
        \ {
        \   'title' : 'VIP',
        \   'contents' : [
        \     '* 1つのIPに対して複数のIPへ分散',
        \     '* いわゆるロードバランサ',
        \     '* 最近はLinuxでもできますよ',
        \     '* 指定のPortが死んだらアクセスさせない',
        \   ]
        \ },
        \ {
        \   'title' : 'MySQLのレプリケーション',
        \   'contents' : [
        \     '* これだけで1冊本がかける',
        \     '* Readを分散できる',
        \     '* Writeの分散は難しい',
        \     '** 子が死んだら親に成り代わるとか',
        \   ]
        \ },
        \ {
        \   'title' : 'shmproxy',
        \   'contents' : [
        \     '* Yahoo!オリジナル技術',
        \     '** 通信用プロキシ',
        \     '** 複数×複数のサーバ間通信に利用',
        \     '** socket張りっぱなし',
        \   ]
        \ },
        \ {
        \   'title' : 'yfor',
        \   'contents' : [
        \     '* Yahoo!オリジナル技術',
        \     '** ソフトウェアに組み込む形のhostname resolver',
        \     '** MySQLへの通信とか',
        \     '** zfor',
        \     'http://github.com/chaoslawful/zfor',
        \     '*** 中国人・・・。',
        \   ]
        \ },
        \ {
        \   'title' : 'まとめ',
        \   'contents' : [
        \     '* 事故について',
        \     '* 事故対応について',
        \     '* Yahoo!JAPANで利用している技術概要',
        \   ]
        \ },
        \ {
        \   'title' : 'one more thing',
        \   'contents' : [
        \     '* 木曜日に転職が決まりました',
        \     '** Yahoo!JAPANは10月いっぱいまで',
        \   ]
        \ },
        \ {
        \   'title' : 'one more thing 2',
        \   'contents' : [
        \     '* 台湾みやげ',
        \     '** 女の子の雑誌が買えませんでした',
        \     '** マンゴー',
        \   ]
        \ },
        \ ]
  let self.current = 0
  let self.currentLine = 0
endfunction

" カレントスライドのタイトルを表示
function! s:Presentation.showPageTitle()
  execute 'normal o '
  call setpos('.', [0, winline(), 1, winwidth(0)/15])
  execute 'normal i ' . self.currentSlide()['title']
  execute 'normal o '
endfunction

" カレントスライドの現在行を表示
function! s:Presentation.showPageContentsLine()
    execute 'normal o '
    call setpos('.', [0, winline(), 1, winwidth(0)/10])
    execute 'normal i ' . self.currentSlide()['contents'][self.currentLine]
endfunction

" カレントスライドを返す
function! s:Presentation.currentSlide()
  return self.slides[self.current]
endfunction

" カレントスライドをクリアする
function! s:Presentation.clearPage()
  execute 'normal ggdG'
  let self.currentLine = 0
endfunction

" カレントスライドの現在行をクリアする
function! s:Presentation.clearPageContentsLine()
  execute 'normal dd'
endfunction

function! s:Presentation.showNextPage()
  let nextIndex = self.current + 1
  if nextIndex == len(self.slides)
    echo '最後のページです'
    return
  endif
  call self.clearPage()
  let self.current = nextIndex
  call self.showPageTitle()
endfunction

function! s:Presentation.showPrevPage()
  let prevIndex = self.current - 1
  if prevIndex < 0
    echo '最初のページです'
    return
  endif
  call self.clearPage()
  let self.current = prevIndex
  call self.showPageTitle()
endfunction

function! s:Presentation.showNextLine()
  let nextIndex = self.currentLine + 1
  if nextIndex > len(self.currentSlide()['contents'])
    " TODO 次ページに飛ぶようにすべき？
    return
  endif
  call self.showPageContentsLine()
  let self.currentLine = nextIndex
endfunction

function! s:Presentation.showPrevLine()
  let prevIndex = self.currentLine - 1
  if prevIndex < 0
    " TODO 前ページに飛ぶようにすべき?
    return
  endif
  call self.clearPageContentsLine()
  let self.currentLine = prevIndex
endfunction

" スクリプトローカルの関数定義
" 次ページを表示
function! s:ShowNextPage()
  call s:Presentation.showNextPage()
endfunction

" 前ページを表示
function! s:ShowPrevPage()
  call s:Presentation.showPrevPage()
endfunction

" カレントスライドの次の行を表示
function! s:ShowNextLine()
  call s:Presentation.showNextLine()
endfunction

" カレントスライドの前の行を表示
function! s:ShowPrevLine()
  call s:Presentation.showPrevLine()
endfunction

" プレゼンテーションを有効化する
function! s:Enable()
  set paste
  set ve=all
  set laststatus=0
  set cursorline
  highlight CursorLine ctermfg=184

  map <buffer> <silent> j :call <SID>ShowNextLine()<CR>
  map <buffer> <silent> k :call <SID>ShowPrevLine()<CR>
  map <buffer> <silent> h :call <SID>ShowPrevPage()<CR>
  map <buffer> <silent> l :call <SID>ShowNextPage()<CR>

  call s:Presentation.clearPage()
  call s:Presentation.load()
  call s:Presentation.showPageTitle()
endfunction

" プレゼンテーションを無効化する
function! s:Disable()
  set nopaste
  set ve=
  set laststatus=2
  set nocursorline
  highlight clear CursorLine
  " TODO mapの定義も解除すべき？bufferローカルだから別にいいかなと思うけど。
endfunction

" コマンドの定義
command! -bar -narg=0 PresentationEnable  call s:Enable()
command! -bar -narg=0 PresentationDisable  call s:Disable()
