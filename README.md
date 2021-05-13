# cocktail_recipe_app

## プロジェクト概要
### SDKバージョン
- Flutter 2.2.0-11.0.pre.69
- Dart SDK version: 2.12.2 (stable)

### プロジェクトディレクトリ
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

### JSONパース
- json_serializable: ^4.1.1
- json_annotation: ^4.0.1

### コード生成 (jsonをクラスに変換する際に使用)
- build_runner: ^1.10.9

### モック化
- mockito: ^5.0.7

## 静的解析
- analyzer: ^1.5.0
- mockito: ^5.0.7

## そのほかのツール
- [gitignore.io](https://www.toptal.com/developers/gitignore)

## 今後
- もう少しプロジェクトとして使えるように以下を導入する
    - ローカルDB
    - push通知
    - navigation