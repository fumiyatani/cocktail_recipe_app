import 'dart:convert';

import 'package:cocktail_recipe_app/data/api/entity/cocktails.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('正しくモデルにパースできるかの確認', () {
    test('Cocktails に変換できるか', () {
      var mock = Cocktails.fromJson(json.decode(testJsonData) as Map<String, dynamic>);

      expect(mock.status, '0000');
      expect(mock.totalPages, 5);
      expect(mock.currentPage, 1);
      expect(mock.cocktails.length, 20);
    });

    test('Cocktail に変換できるか', () {
      var mock = Cocktails.fromJson(json.decode(testJsonData) as Map<String, dynamic>);

      expect(mock.cocktails.first.cocktailId, 1);
      expect(mock.cocktails.first.cocktailName, 'マティーニ');
      expect(mock.cocktails.first.cocktailNameEnglish, 'Martini');
      expect(mock.cocktails.first.baseName, 'ジン');
      expect(mock.cocktails.first.techniqueName, 'ステア');
      expect(mock.cocktails.first.tasteName, '辛口');
      expect(mock.cocktails.first.styleName, 'ショート');
      expect(mock.cocktails.first.alcohol, 42);
      expect(mock.cocktails.first.topName, '食前');
      expect(mock.cocktails.first.glassName, 'カクテルグラス');
      expect(mock.cocktails.first.typeName, 'アルコール');
      expect(mock.cocktails.first.cocktailDigest, 'カクテルの王様');
      expect(mock.cocktails.first.cocktailDesc,
          'ジンの辛味とドライベルモットの香りが絶妙なカクテルの王様。時代が進むにつれ辛口へと変化している。使用するお酒の種類や配合が無数にあるため、バーによって味が異なると言われている。カクテル好きなら1度は味わっておきたい一杯。');
      expect(mock.cocktails.first.recipeDesc, 'ジンとドライベルモットをミキシンググラスでステアし、グラスに注ぐ。オリーブをカクテルピックに刺して沈め、仕上げにレモンピールをふる。');
      expect(mock.cocktails.first.recipes.length, 4);
    });

    test('Recipe に変換できるか', () {
      var mock = Cocktails.fromJson(json.decode(testJsonData) as Map<String, dynamic>);

      expect(mock.cocktails.first.recipes.first.ingredientId, 1);
      expect(mock.cocktails.first.recipes.first.ingredientName, 'ジン');
      expect(mock.cocktails.first.recipes.first.amount, '50');
      expect(mock.cocktails.first.recipes.first.unit, 'ml');
    });
  });
}

const String testJsonData = '''
{
  "status": "0000",
  "total_pages": 5,
  "current_page": 1,
  "cocktails": [
    {
      "cocktail_id": 1,
      "cocktail_name": "マティーニ",
      "cocktail_name_english": "Martini",
      "base_name": "ジン",
      "technique_name": "ステア",
      "taste_name": "辛口",
      "style_name": "ショート",
      "alcohol": 42,
      "top_name": "食前",
      "glass_name": "カクテルグラス",
      "type_name": "アルコール",
      "cocktail_digest": "カクテルの王様",
      "cocktail_desc": "ジンの辛味とドライベルモットの香りが絶妙なカクテルの王様。時代が進むにつれ辛口へと変化している。使用するお酒の種類や配合が無数にあるため、バーによって味が異なると言われている。カクテル好きなら1度は味わっておきたい一杯。",
      "recipe_desc": "ジンとドライベルモットをミキシンググラスでステアし、グラスに注ぐ。オリーブをカクテルピックに刺して沈め、仕上げにレモンピールをふる。",
      "recipes": [
        {
          "ingredient_id": 1,
          "ingredient_name": "ジン",
          "amount": "50",
          "unit": "ml"
        },
        {
          "ingredient_id": 15,
          "ingredient_name": "ドライ・ベルモット",
          "amount": "10",
          "unit": "ml"
        },
        {
          "ingredient_id": 47,
          "ingredient_name": "オリーブ",
          "amount": "1",
          "unit": "個"
        },
        {
          "ingredient_id": 48,
          "ingredient_name": "レモン・ピール",
          "amount": "",
          "unit": "適量"
        }
      ]
    },
    {
      "cocktail_id": 2,
      "cocktail_name": "テキーラ・サンライズ",
      "cocktail_name_english": "Tequila Sunrise",
      "base_name": "テキーラ",
      "technique_name": "ビルド",
      "taste_name": "中甘口",
      "style_name": "ロング",
      "alcohol": 13,
      "top_name": "オール",
      "glass_name": "ゴブレット",
      "type_name": "アルコール",
      "cocktail_digest": "日の出をイメージした美しいカクテル",
      "cocktail_desc": "グレナデン・シロップとオレンジジュースのグラデーションで日の出を表現した美しいカクテル。テキーラ独特の風味とオレンジジュースがマッチした一品。",
      "recipe_desc": "グラスに氷、テキーラ、オレンジジュースを入れてステア（混ぜる）する。グレナデン・シロップを氷に当たらないよう静かに注いで沈めた後、きれいなグラデーションとなるようにバー・スプーンで持ち上げるように混ぜる。",
      "recipes": [
        {
          "ingredient_id": 3,
          "ingredient_name": "テキーラ",
          "amount": "45",
          "unit": "ml"
        },
        {
          "ingredient_id": 34,
          "ingredient_name": "オレンジ・ジュース",
          "amount": "",
          "unit": "FullUP"
        },
        {
          "ingredient_id": 49,
          "ingredient_name": "グレナデン・シロップ",
          "amount": "2",
          "unit": "tsp."
        }
      ]
    },
    {
      "cocktail_id": 3,
      "cocktail_name": "ジン・トニック",
      "cocktail_name_english": "Gin Tonic",
      "base_name": "ジン",
      "technique_name": "ビルド",
      "taste_name": "中辛口",
      "style_name": "ロング",
      "alcohol": 16,
      "top_name": "オール",
      "glass_name": "タンブラー",
      "type_name": "アルコール",
      "cocktail_digest": "ジンの良さをを気軽に楽しめる王道のカクテル",
      "cocktail_desc": "ジンとトニックウォーターをビルドするシンプルなレシピ。家でも簡単に作れる上、さっぱりして飲みやすい。シンプルかつスタンダードなカクテルが故にバーテンダーの腕が出やすいとされる。なお、トニックウォーターだけでは甘すぎる場合は炭酸水を半分入れたジン・ソニックというカクテルもある。",
      "recipe_desc": "グラスに氷を入れてジン注ぎ、その後冷えたトニック・ウォーターでグラスを満たし、炭酸が抜けないよう軽くステアする。最後にカットしたライムを飾り付ける。",
      "recipes": [
        {
          "ingredient_id": 1,
          "ingredient_name": "ジン",
          "amount": "45",
          "unit": "ml"
        },
        {
          "ingredient_id": 35,
          "ingredient_name": "トニック・ウォーター",
          "amount": "",
          "unit": "FullUP"
        },
        {
          "ingredient_id": 50,
          "ingredient_name": "ライム",
          "amount": "1/6",
          "unit": "個"
        }
      ]
    },
    {
      "cocktail_id": 4,
      "cocktail_name": "XYZ",
      "cocktail_name_english": "XYZ",
      "base_name": "ラム",
      "technique_name": "シェイク",
      "taste_name": "中辛口",
      "style_name": "ショート",
      "alcohol": 30,
      "top_name": "オール",
      "glass_name": "カクテルグラス",
      "type_name": "アルコール",
      "cocktail_digest": "「これで終わり」の意味が込められたカクテル",
      "cocktail_desc": "ラムベースの中でもスタンダードカクテルで、ラムの甘みと柑橘の酸味がバランスよく飲みやすい。アルファベット最後の３文字から、「これで終わり」や「これ以上のものはない」といった意味がある。漫画シティーハンターでも登場し、こちらでは「後がない」という意味で登場する。",
      "recipe_desc": "シェーカーにすべての材料と氷を入れてシェイクし、グラスに注ぐ。",
      "recipes": [
        {
          "ingredient_id": 11,
          "ingredient_name": "ホワイト・ラム",
          "amount": "40",
          "unit": "ml"
        },
        {
          "ingredient_id": 14,
          "ingredient_name": "ホワイト・キュラソー",
          "amount": "10",
          "unit": "ml"
        },
        {
          "ingredient_id": 37,
          "ingredient_name": "レモン・ジュース",
          "amount": "10",
          "unit": "ml"
        }
      ]
    },
    {
      "cocktail_id": 5,
      "cocktail_name": "モヒート",
      "cocktail_name_english": "Mojito",
      "base_name": "ラム",
      "technique_name": "ビルド",
      "taste_name": "中口",
      "style_name": "ロング",
      "alcohol": 23,
      "top_name": "オール",
      "glass_name": "コリンズグラス",
      "type_name": "アルコール",
      "cocktail_digest": "近年人気のオシャレでさっぱりとしたカクテル",
      "cocktail_desc": "ラムの甘み、ミントのさわやかな香り、ライムの酸味、炭酸水の爽快感がある夏にぴったりのカクテル。ウイスキーのハイボールよりもスッキリとして飲みやすく、見た目のオシャレさも合わさって日本で人気が高まっている。",
      "recipe_desc": "グラスにスペア・ミント、シュガー・シロップを入れて潰す。その後、ライムを絞ってそのままグラスの中へ入れる。氷を入れ、ホワイト・ラムを注ぎ一度ステア（混ぜる）する。最後に炭酸水を注ぎ、炭酸が抜けないよう軽くステアする。",
      "recipes": [
        {
          "ingredient_id": 11,
          "ingredient_name": "ホワイト・ラム",
          "amount": "45",
          "unit": "ml"
        },
        {
          "ingredient_id": 50,
          "ingredient_name": "ライム",
          "amount": "1/2",
          "unit": "個"
        },
        {
          "ingredient_id": 52,
          "ingredient_name": "シュガー・シロップ",
          "amount": "10",
          "unit": "ml"
        },
        {
          "ingredient_id": 54,
          "ingredient_name": "スペア・ミント",
          "amount": "10-15",
          "unit": "枚"
        },
        {
          "ingredient_id": 33,
          "ingredient_name": "炭酸水",
          "amount": "",
          "unit": "FullUP"
        }
      ]
    },
    {
      "cocktail_id": 6,
      "cocktail_name": "ホワイト・レディ",
      "cocktail_name_english": "White Lady",
      "base_name": "ジン",
      "technique_name": "シェイク",
      "taste_name": "中辛口",
      "style_name": "ショート",
      "alcohol": 34,
      "top_name": "オール",
      "glass_name": "カクテルグラス",
      "type_name": "アルコール",
      "cocktail_digest": "白いドレスの貴婦人をイメージした艶のあるカクテル",
      "cocktail_desc": "1919年、ロンドンの「シローズ・クラブ」のハリーマッケンホルン氏が考案したカクテル。ジンの切れのある味わいに甘みと酸味がマッチしたバランスの良いスタンダードなカクテル。ベースのお酒を変えることでサイドカー、バラライカ、XYZ等のカクテルとなる。",
      "recipe_desc": "シェーカーにすべての材料と氷を入れてシェイクし、グラスに注ぐ。",
      "recipes": [
        {
          "ingredient_id": 1,
          "ingredient_name": "ジン",
          "amount": "30",
          "unit": "ml"
        },
        {
          "ingredient_id": 14,
          "ingredient_name": "ホワイト・キュラソー",
          "amount": "15",
          "unit": "ml"
        },
        {
          "ingredient_id": 37,
          "ingredient_name": "レモン・ジュース",
          "amount": "15",
          "unit": "ml"
        }
      ]
    },
    {
      "cocktail_id": 7,
      "cocktail_name": "ブラッディ・メアリー",
      "cocktail_name_english": "Bloody Mary",
      "base_name": "ウォッカ",
      "technique_name": "ビルド",
      "taste_name": "中口",
      "style_name": "ロング",
      "alcohol": 11,
      "top_name": "オール",
      "glass_name": "コリンズグラス",
      "type_name": "アルコール",
      "cocktail_digest": "二日酔いで辛い朝に迎え酒としても飲まれる一杯",
      "cocktail_desc": "血まみれメアリーと呼ばれたイングランド女王のメアリー１世が由来とされる。野菜スティックを添えたり、ウスターソース、胡椒、タバスコをかける場合もあり、海外では迎え酒として二日酔いの際にも飲まれる。つまんねー事聞くなよ？",
      "recipe_desc": "グラスに氷とすべての材料を入れてステア（混ぜる）する。好みで野菜スティックやレモンを添える。",
      "recipes": [
        {
          "ingredient_id": 2,
          "ingredient_name": "ウォッカ",
          "amount": "45",
          "unit": "ml"
        },
        {
          "ingredient_id": 39,
          "ingredient_name": "トマト・ジュース",
          "amount": "",
          "unit": "適量"
        }
      ]
    },
    {
      "cocktail_id": 8,
      "cocktail_name": "ウォッカ・マティーニ",
      "cocktail_name_english": "Vodka Martini",
      "base_name": "ウォッカ",
      "technique_name": "ステア",
      "taste_name": "辛口",
      "style_name": "ショート",
      "alcohol": 36,
      "top_name": "食前",
      "glass_name": "カクテルグラス",
      "type_name": "アルコール",
      "cocktail_digest": "ベースをウォッカに変えスムースでソフトな飲み口のマティーニ",
      "cocktail_desc": "使用する材料をドライ・ジンをウォッカに変えたマティーニ。ウォッカを使うことでジン特有のクセがなくなり、ややソフトな味わいになる。",
      "recipe_desc": "ウォッカとドライベルモットをミキシンググラスでステアし、グラスに注ぐ。オリーブをカクテルピックに刺して沈め、仕上げにレモンピールをふる。",
      "recipes": [
        {
          "ingredient_id": 2,
          "ingredient_name": "ウォッカ",
          "amount": "45",
          "unit": "ml"
        },
        {
          "ingredient_id": 15,
          "ingredient_name": "ドライ・ベルモット",
          "amount": "15",
          "unit": "ml"
        }
      ]
    },
    {
      "cocktail_id": 9,
      "cocktail_name": "キューバ・リブレ",
      "cocktail_name_english": "Cuba Libre",
      "base_name": "ラム",
      "technique_name": "ビルド",
      "taste_name": "中口",
      "style_name": "ロング",
      "alcohol": 13,
      "top_name": "オール",
      "glass_name": "タンブラー",
      "type_name": "アルコール",
      "cocktail_digest": "キューバの自由万歳！Viva Cuba Libre！",
      "cocktail_desc": "第二次キューバ独立戦争の合言葉から名前のついたカクテルで一般的にラムコークとも呼ばれる。ライムがあれば家でも簡単に作ることができる。ラムのコクとコーラのさっぱりとした味わいにライムの酸味が加わって暑いときにグッと飲みたい味わい。",
      "recipe_desc": "グラスにライムを絞り入れてラムを注ぎ、氷を入れてステア（混ぜる）する。その後冷えたコーラでグラスを満たし、軽くステアする。",
      "recipes": [
        {
          "ingredient_id": 11,
          "ingredient_name": "ホワイト・ラム",
          "amount": "45",
          "unit": "ml"
        },
        {
          "ingredient_id": 40,
          "ingredient_name": "コーラ",
          "amount": "",
          "unit": "FullUP"
        },
        {
          "ingredient_id": 50,
          "ingredient_name": "ライム",
          "amount": "1/2",
          "unit": "個"
        }
      ]
    },
    {
      "cocktail_id": 10,
      "cocktail_name": "青い珊瑚礁",
      "cocktail_name_english": "Blue Coral Reef",
      "base_name": "ジン",
      "technique_name": "シェイク",
      "taste_name": "中甘口",
      "style_name": "ショート",
      "alcohol": 38,
      "top_name": "オール",
      "glass_name": "カクテルグラス",
      "type_name": "アルコール",
      "cocktail_digest": "日本生まれの色合い美しくミントの爽快な味わいを楽しむ",
      "cocktail_desc": "淡いグリーンとマラスキーノ・チェリーの赤色の対比が美しい日本生まれのカクテル。ミントリキュールの爽快な味わいが特徴。1950年の第2回オールジャパン・ドリンクス・コンクールの優勝作品。",
      "recipe_desc": "グラスの縁をレモンで濡らす。シェーカーにジンとグリーン・ミント・リキュールと氷を入れてシェイクし、グラスに注ぐ。最後にマラスキーノ・チェリーをグラスに鎮める。",
      "recipes": [
        {
          "ingredient_id": 1,
          "ingredient_name": "ジン",
          "amount": "40",
          "unit": "ml"
        },
        {
          "ingredient_id": 18,
          "ingredient_name": "グリーン・ミント・リキュール",
          "amount": "20",
          "unit": "ml"
        },
        {
          "ingredient_id": 55,
          "ingredient_name": "マラスキーノ・チェリー",
          "amount": "1",
          "unit": "個"
        },
        {
          "ingredient_id": 37,
          "ingredient_name": "レモン・ジュース",
          "amount": "",
          "unit": "適量"
        }
      ]
    },
    {
      "cocktail_id": 11,
      "cocktail_name": "ギムレット",
      "cocktail_name_english": "Gimlet",
      "base_name": "ジン",
      "technique_name": "シェイク",
      "taste_name": "辛口",
      "style_name": "ショート",
      "alcohol": 32,
      "top_name": "食前",
      "glass_name": "カクテルグラス",
      "type_name": "アルコール",
      "cocktail_digest": "ハードボイルドに決めたい、そんな時にオススメの一杯",
      "cocktail_desc": "ジンとライムのキレのある味わいのスタンダードなカクテル。シンプルだがバーによって味わいが異なるのが面白い。小説「長いお別れ」の中で登場する「ギムレットには早すぎる」というセリフが有名で、小説の中ではジンとイギリス・ローズ社製のライムジュースを半分ずつとなっているが、実際は様々なレシピが存在する。",
      "recipe_desc": "シェーカーにすべての材料と氷を入れてシェイクし、グラスに注ぐ。",
      "recipes": [
        {
          "ingredient_id": 1,
          "ingredient_name": "ジン",
          "amount": "45",
          "unit": "ml"
        },
        {
          "ingredient_id": 36,
          "ingredient_name": "ライム・ジュース",
          "amount": "15",
          "unit": "ml"
        }
      ]
    },
    {
      "cocktail_id": 12,
      "cocktail_name": "ジン・バック",
      "cocktail_name_english": "Gin Buck",
      "base_name": "ジン",
      "technique_name": "ビルド",
      "taste_name": "中口",
      "style_name": "ロング",
      "alcohol": 16,
      "top_name": "オール",
      "glass_name": "タンブラー",
      "type_name": "アルコール",
      "cocktail_digest": "雄鹿のようにキックの効いた一杯",
      "cocktail_desc": "甘みと酸味のバランスがとれジンジャー・エールの炭酸も加わっているため夏にピッタリの爽快なカクテル。",
      "recipe_desc": "グラスに氷を入れてジンとレモン・ジュースを注ぎステア（混ぜる）。その後冷えたジンジャーエールでグラスを満たし、炭酸が抜けないよう軽くステアする。",
      "recipes": [
        {
          "ingredient_id": 1,
          "ingredient_name": "ジン",
          "amount": "45",
          "unit": "ml"
        },
        {
          "ingredient_id": 37,
          "ingredient_name": "レモン・ジュース",
          "amount": "30",
          "unit": "ml"
        },
        {
          "ingredient_id": 41,
          "ingredient_name": "ジンジャーエール",
          "amount": "",
          "unit": "FullUP"
        }
      ]
    },
    {
      "cocktail_id": 13,
      "cocktail_name": "ジン・フィズ",
      "cocktail_name_english": "Gin Fizz",
      "base_name": "ジン",
      "technique_name": "ビルド",
      "taste_name": "中辛口",
      "style_name": "ロング",
      "alcohol": 16,
      "top_name": "オール",
      "glass_name": "タンブラー",
      "type_name": "アルコール",
      "cocktail_digest": "フィズの中でも代表的な一杯",
      "cocktail_desc": "1888年、アメリカ、ニューオーリンズの「インペリアル・キャビネット・サロン」のオーナーが初めて作ったとされるカクテルで、さっぱりと爽快な味わいが特徴。",
      "recipe_desc": "シェーカーに炭酸水以外の材料と氷を入れてシェイクし、氷を入れたグラスに注ぐ。その後冷えた炭酸水でグラスを満たし、炭酸が抜けないよう軽くステアする。",
      "recipes": [
        {
          "ingredient_id": 1,
          "ingredient_name": "ジン",
          "amount": "45",
          "unit": "ml"
        },
        {
          "ingredient_id": 37,
          "ingredient_name": "レモン・ジュース",
          "amount": "20",
          "unit": "ml"
        },
        {
          "ingredient_id": 52,
          "ingredient_name": "シュガー・シロップ",
          "amount": "1",
          "unit": "tsp."
        },
        {
          "ingredient_id": 33,
          "ingredient_name": "炭酸水",
          "amount": "",
          "unit": "FullUP"
        }
      ]
    },
    {
      "cocktail_id": 14,
      "cocktail_name": "カミカゼ",
      "cocktail_name_english": "Kamikaze",
      "base_name": "ウォッカ",
      "technique_name": "シェイク",
      "taste_name": "中辛口",
      "style_name": "ロング",
      "alcohol": 27,
      "top_name": "オール",
      "glass_name": "オールドファッションドグラス",
      "type_name": "アルコール",
      "cocktail_digest": "さっぱりしたアメリカ生まれ",
      "cocktail_desc": "名前は旧日本海軍の神風特攻隊に由来するが、生まれはアメリカのカクテル。ホワイト・キュラソーの甘さにライムの酸味が加わりさっぱりとした味わい。シェイクした上で氷を入れたグラスに注ぐ少し珍しいスタイルを取る。",
      "recipe_desc": "シェーカーにすべての材料と氷を入れてシェイクし、氷を入れたグラスに注ぐ。",
      "recipes": [
        {
          "ingredient_id": 2,
          "ingredient_name": "ウォッカ",
          "amount": "20",
          "unit": "ml"
        },
        {
          "ingredient_id": 14,
          "ingredient_name": "ホワイト・キュラソー",
          "amount": "20",
          "unit": "ml"
        },
        {
          "ingredient_id": 36,
          "ingredient_name": "ライム・ジュース",
          "amount": "20",
          "unit": "ml"
        }
      ]
    },
    {
      "cocktail_id": 15,
      "cocktail_name": "スクリュー・ドライバー",
      "cocktail_name_english": "Screwdriver",
      "base_name": "ウォッカ",
      "technique_name": "ビルド",
      "taste_name": "中口",
      "style_name": "ロング",
      "alcohol": 13,
      "top_name": "オール",
      "glass_name": "タンブラー",
      "type_name": "アルコール",
      "cocktail_digest": "オレンジジュースとウォッカのシンプルで手軽なカクテル",
      "cocktail_desc": "油田の作業員がスクリュー・ドライバー（ねじ回し）で材料をかき混ぜたことからこの名がついた。ウォッカとオレンジジュースを混ぜたシンプルなカクテルで家でも簡単に作れる。あえてマドラーを添えることでねじ回しで混ぜていたことの名残を現している。",
      "recipe_desc": "グラスに氷を入れてウォッカ注ぎ、その後オレンジ・ジュースでグラスを満たし、ステア（混ぜる）する。最後にマドラーを添える。",
      "recipes": [
        {
          "ingredient_id": 2,
          "ingredient_name": "ウォッカ",
          "amount": "45",
          "unit": "ml"
        },
        {
          "ingredient_id": 34,
          "ingredient_name": "オレンジ・ジュース",
          "amount": "",
          "unit": "FullUP"
        }
      ]
    },
    {
      "cocktail_id": 16,
      "cocktail_name": "スレッジ・ハンマー",
      "cocktail_name_english": "Sledge Hammer",
      "base_name": "ウォッカ",
      "technique_name": "シェイク",
      "taste_name": "辛口",
      "style_name": "ショート",
      "alcohol": 28,
      "top_name": "食前",
      "glass_name": "カクテルグラス",
      "type_name": "アルコール",
      "cocktail_digest": "大型ハンマーで殴られるようなシンプルで強烈な味わい",
      "cocktail_desc": "スレッジハンマーとは両手持ちの大型ハンマーで、カクテルの名前の通りウォッカとライムのシンプルで切れのある強烈な組み合わせでぶん殴られるような味わい。ぜひ搾りたての生ライムジュースを使いたい。",
      "recipe_desc": "シェーカーにすべての材料と氷を入れてシェイクし、グラスに注ぐ。",
      "recipes": [
        {
          "ingredient_id": 2,
          "ingredient_name": "ウォッカ",
          "amount": "45",
          "unit": "ml"
        },
        {
          "ingredient_id": 36,
          "ingredient_name": "ライム・ジュース",
          "amount": "15",
          "unit": "ml"
        },
        {
          "ingredient_id": 52,
          "ingredient_name": "シュガー・シロップ",
          "amount": "1",
          "unit": "tsp."
        }
      ]
    },
    {
      "cocktail_id": 17,
      "cocktail_name": "ソルティ・ドッグ",
      "cocktail_name_english": "Salty Dog",
      "base_name": "ウォッカ",
      "technique_name": "ビルド",
      "taste_name": "中口",
      "style_name": "ロング",
      "alcohol": 11,
      "top_name": "オール",
      "glass_name": "オールドファッションドグラス",
      "type_name": "アルコール",
      "cocktail_digest": "スノースタイルが楽しいシンプルなカクテル",
      "cocktail_desc": "船の甲板員を意味するスラングが名前の由来。スノースタイルの塩の口当たりと味わいの変化が楽しいカクテル。",
      "recipe_desc": "グラスの縁をレモンで濡らし、塩をつけてスノースタイルにする。その後ウォッカとグレープフルーツ・ジュースをグラスに注ぎステア（混ぜる）する。",
      "recipes": [
        {
          "ingredient_id": 2,
          "ingredient_name": "ウォッカ",
          "amount": "45",
          "unit": "ml"
        },
        {
          "ingredient_id": 42,
          "ingredient_name": "グレープフルーツ・ジュース",
          "amount": "",
          "unit": "FullUP"
        },
        {
          "ingredient_id": 56,
          "ingredient_name": "塩",
          "amount": "",
          "unit": "適量"
        }
      ]
    },
    {
      "cocktail_id": 18,
      "cocktail_name": "バラライカ",
      "cocktail_name_english": "Balalaika",
      "base_name": "ウォッカ",
      "technique_name": "シェイク",
      "taste_name": "中辛口",
      "style_name": "ショート",
      "alcohol": 30,
      "top_name": "オール",
      "glass_name": "カクテルグラス",
      "type_name": "アルコール",
      "cocktail_digest": "ロシアの民族楽器をイメージしたウォッカベースのカクテル",
      "cocktail_desc": "バラライカとはロシアの民族楽器のこと。口当たりがよく切れのある味わい。ベースを変えることで他の様々なカクテルとなる。",
      "recipe_desc": "シェーカーにすべての材料と氷を入れてシェイクし、グラスに注ぐ。",
      "recipes": [
        {
          "ingredient_id": 2,
          "ingredient_name": "ウォッカ",
          "amount": "30",
          "unit": "ml"
        },
        {
          "ingredient_id": 14,
          "ingredient_name": "ホワイト・キュラソー",
          "amount": "15",
          "unit": "ml"
        },
        {
          "ingredient_id": 37,
          "ingredient_name": "レモン・ジュース",
          "amount": "15",
          "unit": "ml"
        }
      ]
    },
    {
      "cocktail_id": 19,
      "cocktail_name": "ブルドッグ",
      "cocktail_name_english": "Bulldog",
      "base_name": "ウォッカ",
      "technique_name": "ビルド",
      "taste_name": "中口",
      "style_name": "ロング",
      "alcohol": 11,
      "top_name": "オール",
      "glass_name": "オールドファッションドグラス",
      "type_name": "アルコール",
      "cocktail_digest": "尻尾（塩）のないソルティドッグはブルドッグ",
      "cocktail_desc": "ソルティ・ドッグをスノースタイルにせずにウォッカをグレープフルーツ・ジュースで割ったシンプルなカクテル。名前の由来として塩を抜いたソルティ・ドッグ→しっぽがない犬→ブルドッグとなったと言われる。",
      "recipe_desc": "グラスに氷を入れてウォッカ注ぎ、その後グレープフルーツ・ジュースでグラスを満たし、ステア（混ぜる）する。",
      "recipes": [
        {
          "ingredient_id": 2,
          "ingredient_name": "ウォッカ",
          "amount": "45",
          "unit": "ml"
        },
        {
          "ingredient_id": 42,
          "ingredient_name": "グレープフルーツ・ジュース",
          "amount": "",
          "unit": "FullUP"
        }
      ]
    },
    {
      "cocktail_id": 20,
      "cocktail_name": "モスコ・ミュール",
      "cocktail_name_english": "Moscow Mule",
      "base_name": "ウォッカ",
      "technique_name": "ビルド",
      "taste_name": "中口",
      "style_name": "ロング",
      "alcohol": 11,
      "top_name": "オール",
      "glass_name": "タンブラー",
      "type_name": "アルコール",
      "cocktail_digest": "アメリカで流行した「モスクワのラバ」",
      "cocktail_desc": "ラバのひと蹴りと呼ばれる、ウォッカとジンジャーエールとライムのさっぱりとした飲みやすいカクテル。辛口のジンジャーエールでよりピリッとした味わいに。",
      "recipe_desc": "グラスに氷を入れてウォッカとコーディアル・ライム・ジュース注ぎ、その後ジンジャーエールでグラスを満たし、軽くステア（混ぜる）する。",
      "recipes": [
        {
          "ingredient_id": 2,
          "ingredient_name": "ウォッカ",
          "amount": "45",
          "unit": "ml"
        },
        {
          "ingredient_id": 43,
          "ingredient_name": "コーディアル・ライム・ジュース",
          "amount": "1",
          "unit": "tsp."
        },
        {
          "ingredient_id": 41,
          "ingredient_name": "ジンジャーエール",
          "amount": "",
          "unit": "FullUP"
        }
      ]
    }
  ]
}
''';
