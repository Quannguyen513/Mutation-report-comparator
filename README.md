# 🧬 Mutation Report Comparator MRC_QUANDZ

**Công cụ tự động so sánh các cặp mutation report từ Sequencher 5.4.6 cho kiểm soát chất lượng (QC) giải trình tự DNA ty thể (mtDNA).**

Hai nhân viên phân tích cùng một mẫu → tạo 2 file `_1.txt` và `_2.txt` → Tool tự ghép cặp, so sánh, và xuất báo cáo chi tiết.

---

## ✨ Tính năng

- 🔗 **Auto-pair**: Tự ghép cặp file `_1.txt` ↔ `_2.txt` theo tên
- 🔍 **Smart comparison**: So sánh cả 4 cột (Pos, Seq, Con, Required Edit) — xử lý được 2 file khác số dòng mutation
- 📊 **CSV Report**: Báo cáo tổng hợp mở trực tiếp bằng Excel
- 📝 **Diff Details**: Chi tiết khác biệt từng cặp mismatch
- 📂 **Auto-classify**: Phân loại file vào thư mục `matched/` `mismatched/` `unpaired/`
- 🖱️ **Double-click**: Chạy trực tiếp, tự bật cửa sổ chọn thư mục
- 💰 **Hoàn toàn miễn phí**: Chỉ dùng thư viện Python built-in

---

## 📋 Yêu cầu

- **Python 3.8+** (khuyến nghị 3.10+)
- Không cần cài thêm thư viện nào

---

## 🚀 Cách sử dụng

### Cách 1: Double-click (đơn giản nhất)

1. Double-click file `mutation_comparator.py`
2. Chọn thư mục chứa file `.txt`
3. Xem kết quả → CSV report tự mở trong Excel

### Cách 2: Command line

```bash
# Cơ bản
python mutation_comparator.py --input "D:\Data\20260815"

# Chỉ định output riêng
python mutation_comparator.py --input "D:\Data\20260815" --output "D:\Results"

# Chỉ tạo report, không copy file
python mutation_comparator.py --input "D:\Data\20260815" --no-copy
```

### Cách 3: Batch file

Sửa đường dẫn trong `run_compare.bat` → double-click để chạy.

---

## 📁 Cấu trúc Input

Gom tất cả file `.txt` vào 1 thư mục. Tên file kết thúc bằng `_1.txt` và `_2.txt`:

```
📁 input_folder/
├── NC_012920.1 vs D05_L1-R639_20260718_113222_1.txt  ─┐ cặp 1
├── NC_012920.1 vs D05_L1-R639_20260718_113222_2.txt  ─┘
├── NC_012920.1 vs E03_L2-R501_20260718_140055_1.txt  ─┐ cặp 2
├── NC_012920.1 vs E03_L2-R501_20260718_140055_2.txt  ─┘
└── ...
```

---

## 📊 Output

```
📁 comparison_results/
├── 📊 report_YYYY-MM-DD_HHMMSS.csv     ← Báo cáo tổng hợp (Excel)
├── 📁 diff_details/                      ← Chi tiết khác biệt
├── 📁 matched/                           ← File trùng khớp 100%
├── 📁 mismatched/                        ← File có khác biệt
├── 📁 unpaired/                          ← File không có cặp
└── 📋 log_YYYYMMDD_HHMMSS.txt           ← Log xử lý
```

### Ví dụ CSV Report

| STT | Mẫu | Mutations F1 | Mutations F2 | Trùng khớp | Tỷ lệ giống | Kết quả |
|-----|-----|:---:|:---:|:---:|:---:|---------|
| 1 | D05_L1-R639 | 9 | 9 | 9 | 100% | ✅ TRÙNG KHỚP |
| 2 | E03_L2-R501 | 9 | 9 | 7 | 63.6% | ❌ KHÁC BIỆT |

---

## 🧪 Test data

Thư mục `test_data/` chứa 7 file mẫu (4 scenarios):

| Scenario | Kết quả mong đợi |
|----------|-------------------|
| D05 pair: cùng 9 mutations, khác Pos | ❌ MISMATCH (63.6%) |
| E03 pair: giống 100% | ✅ MATCH (100%) |
| F07 pair: khác số dòng (7 vs 5) | ❌ MISMATCH (71.4%) |
| G01: file lẻ, không cặp | ⚠️ UNPAIRED |

Chạy test:

```bash
python mutation_comparator.py --input "test_data" --output "test_output"
```

---

## ⚙️ Tự động hóa (Task Scheduler)

1. Mở **Task Scheduler** → Create Basic Task
2. Đặt lịch (ví dụ: hàng ngày 18:00)
3. Action → Start a program → chọn `run_compare.bat`

---

## 📄 License

[MIT License](LICENSE) — Miễn phí, thoải mái sử dụng và chỉnh sửa.
