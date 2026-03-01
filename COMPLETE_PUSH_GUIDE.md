# 🚀 HƯỚNG DẪN PUSH LÊN GITHUB HOÀN CHỈNH

## ✅ Trạng thái hiện tại

```
Repository: vinhvo2010/thai-vietjet-aeo-project
Commits: 3 commits
Branch: main
Status: Ready to push
```

---

## 🎯 PHƯƠNG PHÁP 1: Push trực tiếp (Khuyến nghị)

### Bước 1: Lấy GitHub Personal Access Token

1. Mở trình duyệt: https://github.com/settings/tokens
2. Click **"Generate new token (classic)"**
3. Đặt tên: `Thai Vietjet AEO Project`
4. Chọn thời hạn: `No expiration` (hoặc 90 ngày)
5. **Chọn scopes:**
   - ✅ **repo** (Full control of private repositories)
   - ✅ **workflow** (Update GitHub Action workflows)
   - ✅ **pages** (Manage GitHub Pages settings)
6. Click **"Generate token"**
7. **COPY TOKEN NGAY** (chỉ hiện 1 lần!)

### Bước 2: Push từ Terminal

```bash
cd /home/user/thai-vietjet-aeo-project
git push -u origin main
```

Khi được hỏi:
- **Username for 'https://github.com':** `vinhvo2010`
- **Password for 'https://vinhvo2010@github.com':** `[Dán token vào đây]`

**Lưu ý:** Password là token, không phải mật khẩu GitHub thông thường!

---

## 🎯 PHƯƠNG PHÁP 2: Dùng Script tự động

```bash
cd /home/user/thai-vietjet-aeo-project
./AUTO_PUSH.sh
```

Script sẽ hỏi token và tự động push.

---

## 🎯 PHƯƠNG PHÁP 3: Push qua GitHub Desktop (Dễ nhất)

1. Tải GitHub Desktop: https://desktop.github.com/
2. Sign in với tài khoản `vinhvo2010`
3. Add local repository: `/home/user/thai-vietjet-aeo-project`
4. Click **"Push origin"**

---

## 🎯 PHƯƠNG PHÁP 4: Push qua VS Code

1. Mở VS Code
2. File → Open Folder → `/home/user/thai-vietjet-aeo-project`
3. Click icon Source Control (Ctrl+Shift+G)
4. Click **"Publish to GitHub"**
5. Chọn `vinhvo2010/thai-vietjet-aeo-project`
6. Click **"Publish"**

---

## 🎯 PHƯƠNG PHÁP 5: Tạo repo mới và upload file

Nếu các cách trên không được:

1. Tạo repo tại: https://github.com/new
   - Name: `thai-vietjet-aeo-project`
   - Visibility: Public
   - **KHÔNG** tick "Add a README"
2. Upload file:
```bash
cd /home/user
cp -r thai-vietjet-aeo-project/* ~/Downloads/thai-vietjet-upload/
```
3. Drag & drop files vào GitHub web interface

---

## 🌐 BẬT GITHUB PAGES

Sau khi push thành công:

1. Truy cập: https://github.com/vinhvo2010/thai-vietjet-aeo-project/settings/pages
2. **Source:** Deploy from a branch
3. **Branch:** `main` / `(root)`
4. Click **Save**
5. Chờ 1-2 phút

### Links sẽ có:
- **Repository:** https://github.com/vinhvo2010/thai-vietjet-aeo-project
- **GitHub Pages:** https://vinhvo2010.github.io/thai-vietjet-aeo-project
- **Slide Deck:** https://vinhvo2010.github.io/thai-vietjet-aeo-project/thai_vietjet_slide_deck.html

---

## ❌ LỖI THƯỜNG GẶP

### 1. "Repository not found"
**Nguyên nhân:** Chưa tạo repo trên GitHub
**Fix:** Tạo tại https://github.com/new

### 2. "Authentication failed"
**Nguyên nhân:** Dùng mật khẩu thay vì token
**Fix:** Dùng Personal Access Token thay vì mật khẩu

### 3. "Permission denied"
**Nguyên nhân:** Token không có scope "repo"
**Fix:** Tạo token mới với scope repo, workflow, pages

### 4. "rejected: non-fast-forward"
**Nguyên nhân:** Remote có commit mới hơn
**Fix:** `git pull origin main --rebase` rồi push

---

## ✅ CHECKLIST SAU PUSH

- [ ] Push thành công (không có lỗi)
- [ ] Repository hiển thị trên GitHub
- [ ] Bật GitHub Pages trong Settings
- [ ] Site live (check sau 2 phút)
- [ ] Slide deck accessible
- [ ] Documentation accessible

---

**Cần hỗ trợ?**
- Xem: `GITHUB_PUSH_GUIDE.md`
- Xem: `GITHUB_PAGES_SETUP.md`
- Script: `./AUTO_PUSH.sh`
