#!/bin/bash

# Script thiết lập GitHub repository và push code
# Usage: ./setup-github.sh <YOUR_GITHUB_USERNAME> <YOUR_GITHUB_EMAIL>

set -e

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "❌ Lỗi: Thiếu tham số"
    echo "Usage: ./setup-github.sh <GITHUB_USERNAME> <GITHUB_EMAIL>"
    echo ""
    echo "Ví dụ: ./setup-github.sh john_doe john@example.com"
    exit 1
fi

USERNAME="$1"
EMAIL="$2"
REPO="thai-vietjet-aeo-project"

echo "🎯 Thai Vietjet AI-First Marketing & AEO Project"
echo "================================================="
echo ""
echo "👤 Username: $USERNAME"
echo "📧 Email: $EMAIL"
echo "📁 Repository: $REPO"
echo ""

# Cấu hình git
echo "🔧 Cấu hình Git..."
git config user.name "$USERNAME"
git config user.email "$EMAIL"
echo "✅ Đã cấu hình Git"

# Khởi tạo repo nếu chưa có
if [ ! -d ".git" ]; then
    echo "🔧 Khởi tạo Git repository..."
    git init
    git branch -m main
fi

# Thêm remote
echo "🔧 Thiết lập remote origin..."
if git remote | grep -q "^origin$"; then
    git remote set-url origin "https://github.com/$USERNAME/$REPO.git"
else
    git remote add origin "https://github.com/$USERNAME/$REPO.git"
fi
echo "✅ Remote origin: https://github.com/$USERNAME/$REPO.git"

# Add và commit
echo "📦 Thêm file vào Git..."
git add .

# Kiểm tra thay đổi
if ! git diff --cached --quiet 2>/dev/null; then
    echo "💾 Commit các thay đổi..."
    git commit -m "Initial commit: Thai Vietjet AI-First Marketing & AEO Strategy

Key deliverables:
• Full AEO implementation guide with 4-phase roadmap
• 15+ slide presentation deck using Reveal.js
• Schema markup guide (JSON-LD for Flight, FAQ, Organization, HowTo)
• Route page template (Bangkok-Phuket example)
• Destination guide template (Phuket example)
• 6-month content calendar
• Budget & ROI projections (THB 945K-1.53M / AUD 42K-68K)
• Competitive analysis (AirAsia, Nok Air, Bangkok Airways)
• Success metrics and KPIs framework
• GitHub Pages configuration with Jekyll theme
• CI/CD workflow for automated deployment
• GitHub issue and PR templates
• Comprehensive README with quick-start guide

Technical features:
• AI-First Marketing strategy optimized for ChatGPT, Perplexity
• Answer Engine Optimization (AEO) implementation
• Airline-specific schema markup (Flight, FlightReservation)
• Technical SEO audit recommendations
• Content strategy for routes and destinations
• Off-page SEO and UGC strategy"
    
    echo "✅ Đã commit"
else
    echo "✅ Không có thay đổi mới (có thể đã commit rồi)"
fi

# Push
echo ""
echo "🚀 Đẩy code lên GitHub..."
echo "⚠️  Bạn sẽ được yêu cầu nhập:"
echo "   • Username: $USERNAME"
echo "   • Password: Personal Access Token (không phải mật khẩu GitHub thông thường)"
echo ""
echo "📖 Để tạo Personal Access Token:"
echo "   1. Truy cập: https://github.com/settings/tokens"
echo "   2. Click 'Generate new token (classic)'"
echo "   3. Chọn scope: repo, workflow, pages"
echo "   4. Copy token và dán khi được hỏi password"
echo ""

# Thử push
git push -u origin main || {
    echo ""
    echo "❌ Push thất bại."
    echo ""
    echo "🔧 Kiểm tra các vấn đề sau:"
    echo "   1. Repository đã được tạo chưa? https://github.com/new"
    echo "      • Name: $REPO"
    echo "      • Visibility: Public (hoặc Private)"
    echo "      • Không tick 'Add a README file'"
    echo ""
    echo "   2. Bạn đã nhập đúng Personal Access Token chưa?"
    echo "      • Token phải có scope 'repo'"
    echo "      • Không nhập mật khẩu GitHub thông thường"
    echo ""
    echo "   3. Kiểm tra remote URL:"
    echo "      git remote -v"
    echo ""
    echo "   4. Thử lại với verbose:"
    echo "      GIT_CURL_VERBOSE=1 git push -u origin main"
    exit 1
}

echo ""
echo "🎉 THÀNH CÔNG!"
echo ""
echo "🔗 Links quan trọng:"
echo "   • Repository:     https://github.com/$USERNAME/$REPO"
echo "   • GitHub Pages:   https://$USERNAME.github.io/$REPO"
echo "   • Slide Deck:     https://$USERNAME.github.io/$REPO/thai_vietjet_slide_deck.html"
echo "   • Documentation:  https://$USERNAME.github.io/$REPO/docs/"
echo ""
echo "📋 Bước tiếp theo - Bật GitHub Pages:"
echo "   1. Truy cập: https://github.com/$USERNAME/$REPO/settings/pages"
echo "   2. Source: Deploy from a branch"
echo "   3. Branch: main / (root)"
echo "   4. Click Save"
echo ""
echo "⏱️  Chờ 1-2 phút để site được deploy"
echo ""
