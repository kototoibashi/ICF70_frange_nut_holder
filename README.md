# ICF70 ConFlat Flange Nut Holder

真空装置の標準規格である ICF70フランジにおいて、締結時のM6ナットを背後から保持し、レンチ不要での作業を可能にするための3Dプリント用ホルダーです。

## 概要

ICF70フランジの締結作業において、狭いスペースでのナット保持は困難を極めます。本部品はPCD58.7mmのボルト配置に完全に適合し、M6ナットを回り止め状態で固定します。

「ハーフモデル」として設計されているため、既存の配管を外すことなく横から差し込むことができ、メンテナンス性に優れています。
### 仕様 (Specifications)

    適合規格: ICF70 (外径70mm)

    ボルト穴: PCD58.7mm 6H (6穴対応 / 本モデルはハーフのため3穴分)

    対応ナット: M6 六角ナット (二面幅 10mm)

### 設計機能:

        45° Chamfer: 外周エッジに45度の面取りを施し、造形品質と取り扱い時の安全性を向上。

        Half-Cut Design: 半円形状により、クランプや既存配管との干渉を最小限に抑制。

        Parametric: OpenSCADにより、公差や厚みの微調整が可能。

## 使用方法

    icf70_nut_holder.scad を OpenSCAD で開き、必要に応じて公差（nut_width）を調整します。

    STLとして出力し、3Dプリンタで造形します。

    フランジの裏側に本パーツをセットし、M6ナットをポケットに挿入します。

    正面からボルトを締めるだけで、レンチを当てることなく固定が完了します。

# ICF70 ConFlat Flange Nut Holder
This 3D-printed holder secures the M6 ​​nut from behind during tightening of the ICF70 flange, a standard for vacuum equipment, enabling wrench-free operation.

## Overview

When tightening an ICF70 flange, securing the nut in a tight space can be extremely challenging. This part perfectly fits the PCD 58.7mm bolt layout and secures the M6 ​​nut in a non-rotating manner.

Designed as a "half model," it can be inserted from the side without removing the existing piping, simplifying maintenance.
### Specifications

Compliant Standard: ICF70 (Outer Diameter: 70mm)

Bolt Hole: PCD58.7mm 6H (Compatible with 6 holes / This model is half-cut, so only 3 holes are required)

Compatible Nut: M6 Hex Nut (Flat Width: 10mm)

### Design Features:

45° Chamfer: A 45-degree chamfer is applied to the outer edge to improve build quality and safety during handling.

Half-Cut Design: The semicircular shape minimizes interference with clamps and existing piping.

Parametric: Fine-tune tolerances and thickness using OpenSCAD.

## How to Use

Open icf70_nut_holder.scad in OpenSCAD and adjust the tolerance (nut_width) as needed.

Export as an STL file and print using a 3D printer.

Place this part behind the flange and insert an M6 nut into the pocket.

Simply tighten the bolts from the front and you can secure it without using a wrench.
