# 🗺️ 開発ロードマップ ─ 詰めFEステージエディタ & ゲーム本体  
> Flutter 3.7 / Riverpod / デスクトップ（macOS・Windows）対応

---

## 0. プロジェクト準備
- [ ] `flutter create gameofFE`
- [ ] `riverpod_generator`, `json_annotation` など依存追加
- [ ] GitHub リポジトリ連携（main ブランチ）

---

## 1. ドメインモデル & 状態管理（デバッグ可能最小構成）
| 項目 | 完了条件 |
|------|---------|
| MapTile / Unit クラス | JSON シリアライズ可 |
| mapDataProvider | 24×16 2次元リストを保持 |
| selectedTerrainProvider | タイルパレットで更新 |
| **デバッグ方法** | `flutter run -d macos` で `print(mapData)` が確認できる |

---

## 2. UI 骨格
1. **画面構成**  
   - `MainScaffold`（左右パネル＋中央キャンバス＋下部インスペクタ）
2. **Widget 雛形**  
   - `TilePaletteWidget`
   - `UnitPaletteWidget`
   - `MapCanvasWidget`（タイルクリックで色が変われば OK）
   - `InspectorWidget`（選択中タイルを表示）
3. **デバッグポイント**  
   - ホットリロードでクリック結果が即反映される  

---

## 3. マップ編集機能 α版
| 機能                     | 実装内容                       |
|--------------------------|--------------------------------|
| タイル配置               | ドラッグ／クリック更新         |
| ユニット配置             | パレット→キャンバスへドラッグ |
| JSON 保存／読込          | `assets/stages/stage01.json`   |
| 初期10ステージ雛形生成   | 空マップで OK                  |

---

## 4. プレビュー再生 β版
- `PreviewPage` を別ルートで追加  
- 必須ロジック  
  - 移動範囲算出（BFS）  
  - 攻撃結果計算（相性ルールのみ）  
- **デバッグ**：1ユニット vs ダミー敵でターンが進めば合格

---

## 5. UI 仕上げ & 快適化
- タイル／ユニットハイライト
- スワイプスクロール & ピンチズーム
- Undo / Redo（最大20手）

---

## 6. ゲーム本体（スマホ）組み込み
1. 共通 `models/` & `services/` を Flutter モバイル側へ流用  
2. モバイル用 `GameScreen` を実装  
3. `stageXX.json` 読み込みで実際に遊べることを確認  

---

## 7. 拡張予定
- 魔法ユニット（射程 1–2 / 物理に弱い）
- SNS 用クリア共有画像生成
- アセット差し替え（AIドット絵 → オリジナル素材）

---

### 開発指示（Codex 用メモ）
1. **Phase 1**  
   > 「MapTile と Unit モデル + Riverpod プロバイダを生成して」  
2. **Phase 2**  
   > 「画面骨格（左右パネル + キャンバス）を Scaffold で実装して」  
3. **Phase 3**  
   > 「TilePaletteWidget と MapCanvasWidget のドラッグ配置機能を追加して」  
4. **Phase 4**  
   > 「簡易プレビューで移動&攻撃を 1 ターンだけシミュレートして」  
