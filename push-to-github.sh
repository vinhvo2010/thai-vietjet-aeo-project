#!/bin/bash

# Script tự động hóa push Thai Vietjet AI-First Marketing & AEO Project lên GitHub
# Usage: ./push-to-github.sh <YOUR_GITHUB_USERNAME>

set -e

# Kiểm tra tham số
if [ -z "$1" ]; then
    echo "❌ Lỗi: Vui lòng cung cấp GitHub username"
    echo "Usage: ./push-to-github.sh <YOUR_GITHUB_USERNAME>"
    echo ""
    echo "Ví dụ: ./push-to-github.sh john_doe"
    exit 1
fi

GITHUB_USERNAME="$1"
REPO_NAME="thai-vietjet-aeo-project"
REMOTE_URL="https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

echo "🚀 Thai Vietjet AI-First Marketing & AEO Project - GitHub Push Script"
echo "==================================================================="
echo ""
echo "📋 Thông tin:"
echo "   • GitHub Username: $GITHUB_USERNAME"
echo "   • Repository: $REPO_NAME"
echo "   • Remote URL: $REMOTE_URL"
echo ""

# Kiểm tra git đã được cài đặt chưa
if ! command -v git &> /dev/null; then
    echo "❌ Lỗi: Git chưa được cài đặt. Vui lòng cài đặt Git trước."
    exit 1
fi

echo "✅ Git đã được cài đặt"

# Khởi tạo git repo nếu chưa có
if [ ! -d ".git" ]; then
    echo "🔧 Khởi tạo Git repository..."
    git init
    git branch -m main
else
    echo "✅ Git repository đã tồn tại"
fi

# Cấu hình git user nếu chưa có
if [ -z "$(git config user.name 2>/dev/null)" ]; then
    echo "⚠️  Chưa cấu hình git user.name"
    read -p "Nhập tên của bạn (ví dụ: John Doe): " GIT_NAME
    git config user.name "$GIT_NAME"
fi

if [ -z "$(git config user.email 2>/dev/null)" ]; then
    echo "⚠️  Chưa cấu hình git user.email"
    read -p "Nhập email của bạn: " GIT_EMAIL
    git config user.email "$GIT_EMAIL"
fi

echo "✅ Git user: $(git config user.name) <$(git config user.email)>"

# Kiểm tra remote
echo ""
echo "🔍 Kiểm tra remote origin..."
if git remote | grep -q "^origin$"; then
    echo "⚠️  Remote 'origin' đã tồn tại"
    CURRENT_URL=$(git remote get-url origin)
    echo "   URL hiện tại: $CURRENT_URL"
    read -p "Bạn có muốn cập nhật remote URL? (y/n): " UPDATE_REMOTE
    if [ "$UPDATE_REMOTE" = "y" ] || [ "$UPDATE_REMOTE" = "Y" ]; then
        git remote set-url origin "$REMOTE_URL"
        echo "✅ Đã cập nhật remote URL"
    fi
else
    echo "🔧 Thêm remote origin..."
    git remote add origin "$REMOTE_URL"
    echo "✅ Đã thêm remote origin"
fi

# Hiển thị trạng thái
echo ""
echo "📊 Trạng thái Git:"
git status --short

# Thêm tất cả file
echo ""
echo "📦 Thêm tất cả file vào staging area..."
git add .

# Kiểm tra xem có file nào để commit không
if git diff --cached --quiet; then
    echo "⚠️  Không có thay đổi nào để commit. Có thể tất cả file đã được commit rồi."
else
    # Commit
    echo ""
    echo "💾 Commit các thay đổi..."
    git commit -m "Initial commit: Thai Vietjet AI-First Marketing & AEO Strategy

- Add full AEO implementation guide with 4-phase roadmap
- Add 15+ slide presentation deck (Reveal.js)
- Add schema markup guide (JSON-LD for Flight, FAQ, Organization)
- Add route page template (Bangkok-Phuket)
- Add destination guide template (Phuket)
- Add 6-month content calendar
- Add budget & ROI projections (THB 945K-1.53M)
- Add competitive analysis (AirAsia, Nok Air, Bangkok Airways)
- Add success metrics and KPIs
- Add GitHub Pages configuration (_config.yml)
- Add CI/CD workflow for auto-deployment
- Add issue and PR templates
- Add comprehensive README with quick-start guide"
    
    echo "✅ Đã commit thành công"
fi

# Push lên GitHub
echo ""
echo "🚀 Push lên GitHub..."
echo "   Target: $REMOTE_URL"
echo ""
echo "⚠️  Lưu ý: Nếu đây là lần đầu push, bạn có thể cần xác thực GitHub."
echo "   • HTTPS: Nhập username và Personal Access Token (không phải password)"
echo "   • SSH: Đảm bảo đã cấu hình SSH key"
echo ""

# Thử push
if git push -u origin main 2>&1; then
    echo ""
    echo "🎉 SUCCESS! Đã push thành công lên GitHub!"
    echo ""
    echo "🔗 Links:"
    echo "   • Repository: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
    echo "   • GitHub Pages: https://$GITHUB_USERNAME.github.io/$REPO_NAME"
    echo "   • Slide Deck: https://$GITHUB_USERNAME.github.io/$REPO_NAME/thai_vietjet_slide_deck.html"
    echo ""
    echo "📋 Bước tiếp theo:"
    echo "   1. Truy cập: https://github.com/$GITHUB_USERNAME/$REPO_NAME/settings/pages"
    echo "   2. Enable GitHub Pages (nếu chưa bật)"
    echo "   3. Source: Deploy from a branch → main → / (root)"
    echo ""
else
    echo ""
    echo "❌ Push thất bại. Các nguyên nhân phổ biến:"
    echo "   1. Repository chưa được tạo trên GitHub"
    echo "   2. Sai username/password hoặc token"
    echo "   3. Không có quyền push"
    echo ""
    echo "🔧 Cách khắc phục:"
    echo "   1. Tạo repository trên GitHub: https://github.com/new"
    echo "      • Repository name: $REPO_NAME"
    echo "      • Để trống (không chọn README, .gitignore, license)"
    echo "   2. Kiểm tra remote URL: git remote -v"
    echo "   3. Thử lại sau khi tạo repository"
    echo ""
    echo "📖 Xem hướng dẫn chi tiết: cat GITHUB_PUSH_GUIDE.md"
fi

