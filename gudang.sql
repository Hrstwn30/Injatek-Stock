/*
 Navicat Premium Data Transfer

 Source Server         : LocalhostMariaDB
 Source Server Type    : MariaDB
 Source Server Version : 110202
 Source Host           : localhost:3306
 Source Schema         : project_sistem_manajemen_barang_gudang

 Target Server Type    : MariaDB
 Target Server Version : 110202
 File Encoding         : 65001

 Date: 23/06/2024 17:49:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_barang
-- ----------------------------
DROP TABLE IF EXISTS `tbl_barang`;
CREATE TABLE `tbl_barang`  (
  `id_barang` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jenis` int(11) NOT NULL,
  `stok_minimum` int(11) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `satuan` int(11) NOT NULL,
  `foto` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_barang`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_barang
-- ----------------------------
INSERT INTO `tbl_barang` VALUES ('B0001', 'Iphone', 3, 1, 5, 1, '429329c3557419b1c38c1f909fa825e368cc4780.png');
INSERT INTO `tbl_barang` VALUES ('B0002', 'Laptop', 1, 1, 0, 1, '5c53fd679d1b99b6cb0ac309f306b2b5fcb729c9.png');
INSERT INTO `tbl_barang` VALUES ('B0003', 'Ipad', 2, 1, 0, 1, '3b73fb88c07d4f361f86573a98f8eb9fd658f997.png');
INSERT INTO `tbl_barang` VALUES ('B0004', 'Iphone 20', 3, 1, 3, 1, '3c7fbe303c94ba6a99422ca8cfd6350381f5c035.png');

-- ----------------------------
-- Table structure for tbl_barang_keluar
-- ----------------------------
DROP TABLE IF EXISTS `tbl_barang_keluar`;
CREATE TABLE `tbl_barang_keluar`  (
  `id_transaksi` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `barang` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_barang_keluar
-- ----------------------------
INSERT INTO `tbl_barang_keluar` VALUES ('TK-0000001', '2024-06-23', 'B0004', 2);

-- ----------------------------
-- Table structure for tbl_barang_masuk
-- ----------------------------
DROP TABLE IF EXISTS `tbl_barang_masuk`;
CREATE TABLE `tbl_barang_masuk`  (
  `id_transaksi` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `barang` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_barang_masuk
-- ----------------------------
INSERT INTO `tbl_barang_masuk` VALUES ('TM-0000001', '2024-06-23', 'B0001', 5);
INSERT INTO `tbl_barang_masuk` VALUES ('TM-0000002', '2024-06-23', 'B0004', 5);

-- ----------------------------
-- Table structure for tbl_jenis
-- ----------------------------
DROP TABLE IF EXISTS `tbl_jenis`;
CREATE TABLE `tbl_jenis`  (
  `id_jenis` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jenis` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_jenis`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_jenis
-- ----------------------------
INSERT INTO `tbl_jenis` VALUES (1, 'Laptop');
INSERT INTO `tbl_jenis` VALUES (2, 'Tablet');
INSERT INTO `tbl_jenis` VALUES (3, 'Smartphone');

-- ----------------------------
-- Table structure for tbl_satuan
-- ----------------------------
DROP TABLE IF EXISTS `tbl_satuan`;
CREATE TABLE `tbl_satuan`  (
  `id_satuan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_satuan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_satuan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_satuan
-- ----------------------------
INSERT INTO `tbl_satuan` VALUES (1, 'Unit');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hak_akses` enum('Administrator','Admin Gudang','Kepala Gudang') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES (1, 'Admin', 'administrator', '$2y$12$Yi/I5f1jPoQNQnh6lWoVfuz.RtZ3OHcKN6PU.I62P0fYK1tJ7xMRi', 'Administrator');
INSERT INTO `tbl_user` VALUES (2, 'Admin Gudang', 'admin_gudang', '$2y$12$A5l7zLeGezLjsIXIH2MSveL9i3XN3mJfRKVsXzUbvrCzAaeuJUSOa', 'Admin Gudang');
INSERT INTO `tbl_user` VALUES (3, 'Kepala Gudang', 'kepala_gudang', '$2y$12$WICYY6NNOca.RTwNtKhoLuO/33cnPzB2gtapJ9SKl7os.Dba7ekjy', 'Kepala Gudang');

-- ----------------------------
-- Triggers structure for table tbl_barang_keluar
-- ----------------------------
DROP TRIGGER IF EXISTS `stok_keluar`;
delimiter ;;
CREATE TRIGGER `stok_keluar` AFTER INSERT ON `tbl_barang_keluar` FOR EACH ROW BEGIN
UPDATE tbl_barang SET stok=stok-NEW.jumlah
WHERE id_barang=NEW.barang;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table tbl_barang_keluar
-- ----------------------------
DROP TRIGGER IF EXISTS `hapus_stok_keluar`;
delimiter ;;
CREATE TRIGGER `hapus_stok_keluar` BEFORE DELETE ON `tbl_barang_keluar` FOR EACH ROW BEGIN
UPDATE tbl_barang SET stok=stok+OLD.jumlah
WHERE id_barang=OLD.barang;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table tbl_barang_masuk
-- ----------------------------
DROP TRIGGER IF EXISTS `stok_masuk`;
delimiter ;;
CREATE TRIGGER `stok_masuk` AFTER INSERT ON `tbl_barang_masuk` FOR EACH ROW BEGIN
UPDATE tbl_barang SET stok=stok+NEW.jumlah
WHERE id_barang=NEW.barang;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table tbl_barang_masuk
-- ----------------------------
DROP TRIGGER IF EXISTS `hapus_stok_masuk`;
delimiter ;;
CREATE TRIGGER `hapus_stok_masuk` BEFORE DELETE ON `tbl_barang_masuk` FOR EACH ROW BEGIN
UPDATE tbl_barang SET stok=stok-OLD.jumlah
WHERE id_barang=OLD.barang;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
