#!/bin/bash
# Script tự động push lên GitHub cho vinhvo2010
# Sử dụng: ./AUTO_PUSH.sh

echo "🚀 ĐẨY REPOSITORY LÊN GITHUB"
echo "============================"
echo ""
echo "📁 Repository: vinhvo2010/thai-vietjet-aeo-project"
echo "📊 Commits: $(git log --oneline | wc -l) commits"
echo ""

# Kiểm tra xem đã push chưa
if git ls-remote origin main 2>/dev/null | grep -q "$(git rev-parse HEAD)"; then
    echo "✅ Repository đã được push lên GitHub!"
    echo ""
    echo "🔗 Links:"
    echo "   • Repository:   https://github.com/vinhvo2010/thai-vietjet-aeo-project"
    echo "   • GitHub Pages: https://vinhvo2010.github.io/thai-vietjet-aeo-project"
    echo ""
    exit 0
fi

echo "⚠️  Repository chưa được push"
echo ""
echo "🔧 CÁCH PUSH:"
echo ""
echo "Phương pháp 1: Sử dụng Personal Access Token"
echo "---------------------------------------------"
echo "1. Tạo token tại: https://github.com/settings/tokens"
echo "2. Chọn scopes: ✅ repo, ✅ workflow, ✅ pages"
echo "3. Copy token"
echo ""
echo "4. Chạy lệnh:"
echo "   git push -u origin main"
echo ""
echo "5. Khi được hỏi:"
echo "   Username: vinhvo2010"
echo "   Password: [Dán token vào đây]"
echo ""
echo "Phương pháp 2: Sử dụng SSH"
echo "--------------------------"
echo "1. Đổi remote sang SSH:"
echo "   git remote set-url origin git@github.com:vinhvo2010/thai-vietjet-aeo-project.git"
echo ""
echo "2. Push:"
echo "   git push -u origin main"
echo ""
echo "Phương pháp 3: Script với token"
echo "-------------------------------"
read -p "Nhập GitHub token (hoặc nhấn Enter để hủy): " TOKEN

if [ -z "$TOKEN" ]; then
    echo "❌ Đã hủy"
    exit 1
fi

echo "🔧 Đang push với token..."
git remote set-url origin "https://vinhvo2010:${TOKEN}@github.com/vinhvo2010/thai-vietjet-aeo-project.git"

if git push -u origin main; then
    echo ""
    echo "🎉 THÀNH CÔNG!"
    echo ""
    echo "🔗 Links:"
    echo "   • Repository:   https://github.com/vinhvo2010/thai-vietjet-aeo-project"
    echo "   • GitHub Pages: https://vinhvo2010.github.io/thai-vietjet-aeo-project"
    echo ""
    echo "📋 Bước tiếp theo - Bật GitHub Pages:"
    echo "   1. Truy cập: https://github.com/vinhvo2010/thai-vietjet-aeo-project/settings/pages"
    echo "   2. Source: Deploy from a branch"
    echo "   3. Branch: main / (root)"
    echo "   4. Click Save"
    echo ""
    # Reset remote URL về dạng bình thường
    git remote set-url origin "https://github.com/vinhvo2010/thai-vietjet-aeo-project.git"
else
    echo "❌ Push thất bại"
    echo "Kiểm tra lại token và thử lại"
fi
