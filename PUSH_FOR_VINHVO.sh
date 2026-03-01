#!/bin/bash
# Script push lên GitHub cho vinhvo2010
# Usage: ./PUSH_FOR_VINHVO.sh <GITHUB_TOKEN>

set -e

if [ -z "$1" ]; then
    echo "❌ Lỗi: Thiếu GitHub Token"
    echo ""
    echo "🔧 Cách lấy GitHub Token:"
    echo "1. Truy cập: https://github.com/settings/tokens"
    echo "2. Click 'Generate new token (classic)'"
    echo "3. Chọn scopes: ✅ repo, ✅ workflow, ✅ pages"
    echo "4. Copy token"
    echo ""
    echo "Usage: ./PUSH_FOR_VINHVO.sh ghp_xxxxxxxxxxxxxxxxxxxx"
    exit 1
fi

TOKEN="$1"
REPO="https://github.com/vinhvo2010/thai-vietjet-aeo-project.git"

echo "🚀 Push Thai Vietjet AEO Project lên GitHub"
echo "=============================================="
echo ""
echo "📁 Repository: vinhvo2010/thai-vietjet-aeo-project"
echo "🔗 URL: https://github.com/vinhvo2010/thai-vietjet-aeo-project"
echo ""

# Push với token
echo "📤 Đang push lên GitHub..."
git push -u origin main || {
    echo ""
    echo "⚠️  Push thất bại. Thử với token..."
    
    # Tạo URL với token
    AUTH_REPO="https://vinhvo2010:${TOKEN}@github.com/vinhvo2010/thai-vietjet-aeo-project.git"
    
    # Thêm remote với auth
    git remote remove origin 2>/dev/null || true
    git remote add origin "$AUTH_REPO"
    
    # Push
    git push -u origin main
}

echo ""
echo "🎉 THÀNH CÔNG!"
echo ""
echo "🔗 Links:"
echo "   • Repository:   https://github.com/vinhvo2010/thai-vietjet-aeo-project"
echo "   • GitHub Pages: https://vinhvo2010.github.io/thai-vietjet-aeo-project"
echo "   • Slide Deck:   https://vinhvo2010.github.io/thai-vietjet-aeo-project/thai_vietjet_slide_deck.html"
echo ""
echo "📋 Bước tiếp theo - Bật GitHub Pages:"
echo "   1. Truy cập: https://github.com/vinhvo2010/thai-vietjet-aeo-project/settings/pages"
echo "   2. Source: Deploy from a branch"
echo "   3. Branch: main / (root)"
echo "   4. Click Save"
echo ""
echo "⏱️  Chờ 1-2 phút để site được deploy"
echo ""
