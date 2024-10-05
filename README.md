# Structural Equation Modeling

## Read the Japanese version here:
[Structural Equation Modeling (Japanese explanation)](https://note.com/exerciseandbrain/n/nd42713fd9a34)

This repository contains an R script for performing various types of factor analysis and structural equation modeling on the Big Five Inventory (BFI) dataset.

## Overview

The script performs the following analyses:
- Exploratory Factor Analysis (EFA)
- Confirmatory Factor Analysis (CFA)
- Structural Equation Modeling (SEM)
- Statistical Causal Discovery using LiNGAM

## Dataset

The script uses the Big Five Inventory (BFI) dataset, included in the `psych` R package. It focuses on three personality traits:

## Prerequisites

To run this script, you need R installed on your system, along with the following packages:
- `psych`
- `GPArotation`
- `dplyr`
- `lavaan`
- `semTools`
- `semPlot`
- `tidyverse`
- `pcalg`
- `igraph`

## References

1. 豊田秀樹 (1998). *共分散構造分析 入門編―構造方程式モデリング (統計ライブラリー)*. 朝倉書店.
2. 豊田秀樹 (2014). *共分散構造分析[R編]―構造方程式モデリング*. 東京書籍.
3. 津田裕之. *Rによる統計入門 因子分析*.
4. 清水裕士. *Rで因子分析 商用ソフトで実行できない因子分析のあれこれ*.
5. TOMOKOBA BLOG. *探索的因子分析*.
6. 井出草平の研究ノート. *Rで因子分析 基礎*.
7. 土屋政雄. *researchmap 検証的（確証的／確認的）因子分析: confirmatory factor analysis (CFA)*.
8. ねこすたっと. *データ構造を要約・説明する(1)：探索的因子分析（psychパッケージ）[R]*.
9. 土屋政雄. *researchmap lavaanで確認的（確証的／検証的）因子分析：confirmatory factor analysis (CFA)*.
10. 荒木孝治. *lavaanチュートリアル*.
11. ビジネスリサーチラボ. *確認的因子分析とは何か*.
12. 清水昌平 (2017). *統計的因果探索 (機械学習プロフェッショナルシリーズ)*. 講談社.
13. 小川雄太郎 (2020). *つくりながら学ぶ! Pythonによる因果分析 ~因果推論・因果探索の実践入門 (Compass Data Science)*. マイナビ出版.
14. NHN TECHORUS Tech Blog. *「統計的因果探索」の一部を動かしてみた*.
15. *Rによるデータ分析 RによるLiNGAM*.
16. mikutaifukuの雑記帳. *Fitbitデータで因果を探索してみる〜独立成分分析によるLiNGAMモデルの推定〜*.

