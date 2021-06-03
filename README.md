# cocktail_recipe_app

## 開発環境
- Android Studio 4.2
- Flutter 2.2.0-11.0.pre.69
- Dart SDK version: 2.12.2 (stable)

### ディレクトリ
```
lib
├─ data
│   └─ api
│       ├─ cocktail_search_api.dart
│       ├─ cocktail_search_api_impl.dart
│       └── entity
│             ├── Cocktails.g.dart
│             └── cocktails.dart
├── domain
│     └─ cocktail_list_use_case.dart
├─ main.dart
└─ screens
    └── list
        ├─ cocktail_expansion_panel_item.dart
        ├─ cocktail_ext.dart
        ├─ cocktail_list_page.dart
        └─ cocktail_list_view_model.dart
```

## 使用ライブラリ
### 状態管理
- provider: ^5.0.0

### 通信
- http: ^0.13.2
- chopper: ^4.0.0-nullsafety.1

### JSONパース
- json_serializable: ^4.1.1
- json_annotation: ^4.0.1

### コード生成 (jsonをクラスに変換する際に使用)
- build_runner: ^1.10.9

### モック化
- mockito: ^5.0.7
- chopper_generator: ^4.0.0-nullsafety.1

## 静的解析
- analyzer: ^1.5.0
- mockito: ^5.0.7

## そのほかのツール
- [gitignore.io](https://www.toptal.com/developers/gitignore)

## コマンド
- flutter pub get
    - ライブラリをインストールした際に使用する
- flutter pub run build_runner build --delete-conflicting-outputs
    - Chopper の通信処理や JSON パース用のクラスを書き換えた際に使用する
- flutter test
    - テストの実行
- flutter channel
    - 現在のチャンネルを確認できる
- flutter channel [master|dev|beta|stable]
    - チャンネルの選択を行う
- flutter upgrade
    - flutter のアップデートを行う

## 今後
- もう少しプロジェクトとして使えるように以下を導入する
    - ローカルDB
    - push通知
    - navigation