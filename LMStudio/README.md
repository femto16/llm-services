# LMStudio
## インストール
- LMStudio\install_LMStudio.bat を実行
## モデルのダウンロード
- LMStudio\get_model.bat を実行
## モデル設定
- LMStudioを開く
- gpt-oss-20bの設定(Actionsの歯車マーク)で以下を変更する
    - Load
        - Context Length: 4096～131072
            - 多くするとVRAM消費量が大きくなるので要調整
        - Force Model Expert Weights onto CPU: ON
        - Flash Attention: ON
        - K Cache Quantization Type: ON
        - V Cache Quantization Type: ON
    - Custom Fields
        - Reasonig Effort: Medium
- チャット画面でモデルが動作することを確認する
## サーバ起動
- Developer > ラジオボタンをONにしてサーバ起動
- Settingsを変更する
    - 外部から接続可能にするため、Serve on Local NetworkをONにする
    - (任意)モデルの自動アンロード機能を切ってずっとロードさせる場合は、Auto unload unused JIT loaded modelsをOFFにする
# サーバテスト
- test_server.batを実行してレスポンスが返るのを確認する