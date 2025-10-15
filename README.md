# clasp utility

## Directory
```
.
├── .clasp.json
├── .gitignore
├── appsscript.json
└── src
    ├── code.js
    └── code.html
```

## Shells
### clasp_start.sh
1. ディレクトリ作成
2. .clasp.json編集
3. TImeZoneを東京に変更

### clasp_push.sh
1. .clasp.json / appsscript.json をsrc 配下にコピー
2. src 配下をpush
3. src 配下の.clasp.json / appsscript.json を削除

### clasp_deploy.sh
1. clasp_push.sh 実行
2. 過去にwebアプリをビルドした履歴を調べる
3. webアプリのURLが変更されないようビルド

### clasp_run.sh
1. 実行に必要な設定ファイルコピー
2. run 実行
3. 設定ファイルの削除
