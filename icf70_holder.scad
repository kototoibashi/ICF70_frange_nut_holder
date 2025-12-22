// ==========================================
// PCD58.7mm 6H M6 Nut Holder (Half & Chamfered)
// ==========================================
// --- パラメータ設定 ---
$fn = 120;             // 解像度
pcd = 58.7;           // ピッチ円直径
num_holes = 6;        // 全周の穴数
nut_width = 9.7;     // M6ナット二面幅　微調整を推奨（公称10mm）
nut_depth = 5.0;      // ナットポケット深さ
bolt_hole = 6.6;      // ボルト貫通穴（公差込 6.6mm）
base_height = 7;     // 全体の厚み
outer_dia = 74.0;     // 外径
chamfer = 4.0;        // 面取り幅
nut_chamfer = 0.5;    // ナット面取り
nut_chamfer2 = 0.3;    // ナット面取り
// --- 統合モジュール ---
intersection() {
    // 1. メインボディ構築
    difference() {
        // 本体形状：面取りを実現するために垂直部と円錐台を結合
        union() {
            cylinder(h = chamfer, d1 = outer_dia - (chamfer * 1), d2 = outer_dia);
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
            translate([pcd / 2, 0, -0.1]) {
                // ボルト穴
                cylinder(h = base_height + 0.2, d = bolt_hole);
                // ナットポケット本体
                translate([0, 0, base_height - nut_depth])
                rotate([0, 0, 30])
                cylinder(h = nut_depth+0.1, d = nut_width / cos(30), $fn = 6);
                // ナットポケット面取り
                translate([0, 0, base_height - nut_depth - nut_chamfer2])
                rotate([0, 0, 30])
                cylinder(h = nut_chamfer2, 
                        d2 = nut_width / cos(30), 
                        d1 = (nut_width - nut_chamfer2 * 2) / cos(30), 
                        $fn = 6);
                // ナット挿入用面取り
                translate([0, 0, base_height - nut_chamfer])
                rotate([0, 0, 30])
                cylinder(h = nut_chamfer + 0.2, 
                        d1 = nut_width / cos(30), 
                        d2 = (nut_width + nut_chamfer * 2) / cos(30), 
                        $fn = 6);
            }
        }
        // 肉抜き 材料削減とビルドプレート剥離性向上
        for (i = [0 : num_holes - 1]) {
            angle = i * 360 / num_holes;
            rotate([0, 0, angle])
            translate([pcd / 2, 0, -0.1]) {
                rotate([90, 0, 90])
                translate([0, -base_height*0.9,-outer_dia])
                cylinder(h=outer_dia*2, r=base_height);
            }
        }
        // 切り込み ビルドプレート剥離性向上
        rotate([90, 0, 90])
        translate([0, -base_height*1,-outer_dia])
        cylinder(h=outer_dia*2, r=base_height*1.4);
    }
    // 2. ハーフカット処理（Y領域の正の方向のみを抽出）
    // 外周に余裕を持たせたバウンディングボックス
    translate([-outer_dia, 5, -0.1])
    cube([outer_dia * 2, outer_dia, base_height + 0.2]);
}
