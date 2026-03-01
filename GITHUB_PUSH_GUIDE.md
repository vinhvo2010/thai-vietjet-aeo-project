# 🚀 Hướng Dẫn Đẩy Dự Án Lên GitHub

## 📋 Tổng Quan

Đây là hướng dẫn chi tiết để đẩy toàn bộ dự án **Thai Vietjet AI-First Marketing & AEO Strategy** lên GitHub.

## 🎯 Các Bước Thực Hiện

### Bước 1: Tạo Repository Trên GitHub

1. Đăng nhập vào [GitHub](https://github.com)
2. Click vào nút **+** → **New repository**
3. Điền thông tin:
   - **Repository name**: `thai-vietjet-aeo-project`
   - **Description**: `Thai Vietjet AI-First Marketing & AEO Strategy Implementation`
   - Chọn **Public** hoặc **Private** (tùy ý)
   - ✅ Check "Add a README file" (tùy chọn)
   - ✅ Check "Add .gitignore" → chọn "Node"
   - ✅ Check "Choose a license" → chọn "MIT License"
4. Click **Create repository**

### Bước 2: Clone Repository Về Máy

```bash
git clone https://github.com/YOUR_USERNAME/thai-vietjet-aeo-project.git
cd thai-vietjet-aeo-project
```

### Bước 3: Copy Files Vào Repository

**Cách 1: Sử dụng file ZIP đã tạo**

```bash
# Giải nén file ZIP
cd /path/to/downloaded/zip
unzip thai-vietjet-aeo-project.zip

# Copy tất cả files vào repository
cp -r thai-vietjet-aeo-project/* /path/to/your/git/repo/
```

**Cách 2: Sử dụng terminal trực tiếp**

```bash
# Tạo cấu trúc thư mục
mkdir -p thai-vietjet-aeo-project/{docs,templates,assets,src,.github/workflows,.github/ISSUE_TEMPLATE}

# Copy các file đã tải về
cp /path/to/*.html thai-vietjet-aeo-project/
cp /path/to/docs/*.html thai-vietjet-aeo-project/docs/
cp /path/to/templates/*.html thai-vietjet-aeo-project/templates/
```

### Bước 4: Cấu Hình Git

```bash
# Cấu hình user (nếu chưa có)
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Khởi tạo git (nếu chưa có)
git init
```

### Bước 5: Add Files Và Commit

```bash
# Add tất cả files
git add .

# Kiểm tra status
git status

# Commit với message mô tả
git commit -m "Initial commit: Thai Vietjet AI-First Marketing & AEO Strategy

- Add complete implementation guide with 4-phase roadmap
- Add 15+ slide presentation deck for Board presentation
- Add schema markup guide with JSON-LD examples
- Add route page template (Bangkok to Phuket)
- Add destination guide template (Phuket)
- Add 6-month content calendar
- Add budget and ROI projections
- Add competitive analysis
- Add success metrics and KPIs
- Add GitHub Pages configuration"
```

### Bước 6: Push Lên GitHub

```bash
# Thêm remote repository
git remote add origin https://github.com/YOUR_USERNAME/thai-vietjet-aeo-project.git

# Push lên main branch
git push -u origin main

# Nếu gặp lỗi, thử:
git push -u origin master
```

### Bước 7: Kích Hoạt GitHub Pages

1. Vào repository trên GitHub
2. Click **Settings** → **Pages** (bên trái)
3. Ở mục **Source**, chọn:
   - **Deploy from a branch**
   - **Branch**: `main` hoặc `master`
   - **Folder**: `/ (root)`
4. Click **Save**
5. Đợi 1-2 phút, sau đó truy cập:
   `https://YOUR_USERNAME.github.io/thai-vietjet-aeo-project`

### Bước 8: Cấu Hình Custom Domain (Tùy Chọn)

Nếu muốn sử dụng domain riêng:

1. Trong **Settings** → **Pages**, mục **Custom domain**
2. Nhập domain của bạn: `thai-vietjet-aeo.yourdomain.com`
3. Click **Save**
4. Thêm DNS record tại domain provider:
   - Type: CNAME
   - Name: `thai-vietjet-aeo`
   - Value: `YOUR_USERNAME.github.io`

## 🔧 Các Lệnh Git Hữu Ích

```bash
# Kiểm tra remote
git remote -v

# Pull latest changes
git pull origin main

# Xem log
git log --oneline --graph

# Tạo branch mới
git checkout -b feature/new-feature

# Merge branch
git checkout main
git merge feature/new-feature

# Xóa branch
git branch -d feature/new-feature
```

## 🐛 Xử Lý Lỗi Thường Gặp

### Lỗi 1: "Permission denied"
```bash
# Sử dụng SSH thay vì HTTPS
git remote set-url origin git@github.com:YOUR_USERNAME/thai-vietjet-aeo-project.git

# Hoặc sử dụng token
git remote set-url origin https://TOKEN@github.com/YOUR_USERNAME/thai-vietjet-aeo-project.git
```

### Lỗi 2: "Updates were rejected"
```bash
# Pull trước khi push
git pull origin main --rebase
git push origin main
```

### Lỗi 3: "Failed to connect to github.com"
```bash
# Kiểm tra kết nối mạng
ping github.com

# Hoặc sử dụng proxy
git config --global http.proxy http://proxy.example.com:8080
```

## 📁 Cấu Trúc Repository Sau Khi Push

```
thai-vietjet-aeo-project/
├── 📄 index.html                    ← Main page (GitHub Pages)
├── 📁 docs/                         ← Documentation
│   ├── thai_vietjet_executive_presentation.html
│   ├── thai_vietjet_aeo_implementation_guide.html
│   ├── thai_vietjet_schema_markup_guide.html
│   ├── thai_vietjet_project_summary.html
│   ├── thai_vietjet_content_calendar.html
│   └── thai_vietjet_final_package.html
├── 📁 templates/                    ← HTML templates
│   ├── thai_vietjet_route_page_template.html
│   └── thai_vietjet_destination_guide_template.html
├── 📁 assets/                       ← Images, CSS, JS
├── 📁 src/                          ← Source code
├── 📄 README.md                     ← Project overview
├── 📄 LICENSE                       ← MIT License
├── 📄 _config.yml                   ← GitHub Pages config
├── 📄 CHANGELOG.md                  ← Version history
├── 📄 CONTRIBUTING.md               ← Contribution guide
├── 📄 .gitignore                    ← Git ignore rules
└── 📄 package.json                  ← NPM config
```

## 🌐 Link Truy Cập Sau Khi Deploy

- **Main Site**: `https://YOUR_USERNAME.github.io/thai-vietjet-aeo-project`
- **Slide Deck**: `https://YOUR_USERNAME.github.io/thai-vietjet-aeo-project/thai_vietjet_slide_deck.html`
- **Docs**: `https://YOUR_USERNAME.github.io/thai-vietjet-aeo-project/docs/`

## 📞 Hỗ Trợ

Nếu gặp vấn đề, hãy:
1. Kiểm tra lại các bước trong hướng dẫn
2. Xem log lỗi chi tiết
3. Tìm kiếm trên [GitHub Docs](https://docs.github.com)
4. Tạo issue trong repository này

---

**Chúc bạn thành công! 🎉**
