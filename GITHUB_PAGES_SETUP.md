# 🌐 Cấu hình GitHub Pages cho vinhvo2010/thai-vietjet-aeo-project

## ✅ Đã hoàn thành
- [x] Khởi tạo Git repository
- [x] Cấu hình Git user (vinhvo2010)
- [x] Thêm remote origin
- [x] Commit 25 files
- [ ] Push lên GitHub (cần Personal Access Token)
- [ ] Bật GitHub Pages

---

## 🚀 Push lên GitHub

### Cách 1: Sử dụng Personal Access Token

```bash
cd /home/user/thai-vietjet-aeo-project
./PUSH_FOR_VINHVO.sh YOUR_GITHUB_TOKEN
```

**Hoặc push thủ công:**
```bash
# Lấy token từ: https://github.com/settings/tokens
export GITHUB_TOKEN="ghp_xxxxxxxxxxxxxxxxxxxx"

# Push
git push -u origin main
```

Khi được hỏi password, nhập **Personal Access Token** thay vì mật khẩu GitHub.

### Cách 2: SSH (nếu đã cấu hình)
```bash
git remote set-url origin git@github.com:vinhvo2010/thai-vietjet-aeo-project.git
git push -u origin main
```

---

## 🌐 Bật GitHub Pages

### Bước 1: Truy cập Settings
1. Vào: https://github.com/vinhvo2010/thai-vietjet-aeo-project/settings/pages
2. Hoặc: GitHub repo → Settings → Pages (left sidebar)

### Bước 2: Cấu hình Source
```
Source: Deploy from a branch
Branch: main / (root)
```

### Bước 3: Save
Click **Save**

### Bước 4: Chờ deploy
- Thời gian: 1-2 phút
- Kiểm tra: Actions tab → Pages build and deployment

---

## 🔗 URLs sau khi deploy

| Resource | URL |
|----------|-----|
| **Repository** | https://github.com/vinhvo2010/thai-vietjet-aeo-project |
| **GitHub Pages** | https://vinhvo2010.github.io/thai-vietjet-aeo-project |
| **Slide Deck** | https://vinhvo2010.github.io/thai-vietjet-aeo-project/thai_vietjet_slide_deck.html |
| **Documentation** | https://vinhvo2010.github.io/thai-vietjet-aeo-project/docs/ |
| **Route Template** | https://vinhvo2010.github.io/thai-vietjet-aeo-project/templates/thai_vietjet_route_page_template.html |
| **Destination Template** | https://vinhvo2010.github.io/thai-vietjet-aeo-project/templates/thai_vietjet_destination_guide_template.html |

---

## 🎨 Custom Domain (Tùy chọn)

Nếu muốn dùng domain riêng (ví dụ: thai-vietjet-aeo.weoz.com.au):

1. Tạo file `CNAME` trong repo:
```bash
echo "thai-vietjet-aeo.weoz.com.au" > CNAME
git add CNAME
git commit -m "Add custom domain"
git push
```

2. DNS settings:
   - Type: CNAME
   - Name: thai-vietjet-aeo
   - Value: vinhvo2010.github.io

3. GitHub Settings:
   - Custom domain: thai-vietjet-aeo.weoz.com.au
   - Enforce HTTPS: ✅

---

## 📝 Cập nhật nội dung

Sau khi push thành công, để cập nhật:

```bash
cd /home/user/thai-vietjet-aeo-project
# Thay đổi file
git add .
git commit -m "Update: [mô tả thay đổi]"
git push
```

Tự động deploy lên GitHub Pages sau 1-2 phút.

---

## ❓ Lỗi thường gặp

### 1. "Repository not found"
**Nguyên nhân**: Repository chưa được tạo
**Fix**: Tạo tại https://github.com/new (name: thai-vietjet-aeo-project)

### 2. "Authentication failed"
**Nguyên nhân**: Dùng mật khẩu thay vì token
**Fix**: Tạo token tại https://github.com/settings/tokens

### 3. "rejected: non-fast-forward"
**Nguyên nhân**: Remote có commit mới
**Fix**: `git pull origin main --rebase` rồi push

### 4. "Permission denied"
**Nguyên nhân**: Token không có scope "repo"
**Fix**: Tạo token mới với scope: ✅ repo, ✅ workflow, ✅ pages

---

## 📞 Hỗ trợ

- Xem: `GITHUB_PUSH_GUIDE.md`
- Xem: `QUICK_START.md`
- Script: `./PUSH_FOR_VINHVO.sh`

---

**Ngày tạo**: 2026-03-01
**Version**: 1.0.0
