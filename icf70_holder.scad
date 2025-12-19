// This work is marked with CC0 1.0 Universal. 
// To view a copy of this license, visit http://creativecommons.org/publicdomain/zero/1.0/

// ==========================================
// PCD58.7mm 6H M6 Nut Holder (Half & Chamfered)
// ==========================================

// --- パラメータ設定 ---
$fn = 120;             // 解像度
pcd = 58.7;           // ピッチ円直径
num_holes = 6;        // 全周の穴数
nut_width = 9.8;     // M6ナット二面幅（公差込 10.3mm）
nut_depth = 5.2;      // ナットポケット深さ
bolt_hole = 6.6;      // ボルト貫通穴（公差込 6.6mm）
base_height = 8;     // 全体の厚み
outer_dia = 74.0;     // 外径
chamfer = 3.0;        // 45deg面取り幅

// --- 統合モジュール ---
intersection() {
    // 1. メインボディ構築
    difference() {
        // 本体形状：面取りを実現するために垂直部と円錐台を結合
        union() {
            cylinder(h = chamfer, d1 = outer_dia - (chamfer * 2), d2 = outer_dia);

            // 2. 上部の垂直セクション
            // 面取りの高さ分だけ上に移動させて結合
            translate([0, 0, chamfer])
            cylinder(h = base_height - chamfer, d = outer_dia);
        }

        // 中心穴（軽量化・軸合わせ）
        translate([0, 0, -0.1])
        cylinder(h = base_height + 0.2, d = pcd - 15);

        // PCD上の6個の穴とナットポケット
        for (i = [0 : num_holes - 1]) {
            angle = i * 360 / num_holes + 30;
            rotate([0, 0, angle])
            translate([pcd / 2, 0, 0]) {
                // ボルト貫通穴
                cylinder(h = base_height + 0.2, d = bolt_hole);
                // M6ナット回り止め（六角形）
                translate([0, 0, base_height - nut_depth + 0.1])
                rotate([0, 0, 30])
                cylinder(h = nut_depth, d = nut_width / cos(30), $fn = 6);
            }
        }
    }

    // 2. ハーフカット処理（Y領域の正の方向のみを抽出）
    // 外周に余裕を持たせたバウンディングボックス
    translate([-outer_dia, 3, -0.1])
    cube([outer_dia * 2, outer_dia, base_height + 0.2]);
}

// --- 補足：断面の角を丸めたい場合（オプション） ---
// 断面自体の角は鋭利なままですが、積層造形上の強度と安全性はこれで十分担保されます。