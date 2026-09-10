#!/bin/bash

echo "🚀 جاري نشر المشروع على Vercel..."
echo ""

# Check if vercel is installed
if ! command -v vercel &> /dev/null; then
    echo "📦 تثبيت Vercel CLI..."
    npm install -g vercel
fi

# Create vercel token file (if needed)
if [ -z "$VERCEL_TOKEN" ]; then
    echo "⚠️  لا يوجد VERCEL_TOKEN"
    echo ""
    echo "الطرق البديلة للنشر:"
    echo ""
    echo "1️⃣  استخدام GitHub:"
    echo "   - ادفع المشروع إلى GitHub (مكتمل ✅)"
    echo "   - اتصل Vercel بـ GitHub"
    echo "   - سيتم النشر تلقائياً"
    echo ""
    echo "2️⃣  استخدام Vercel CLI:"
    echo "   vercel login"
    echo "   cd ~/Desktop"
    echo "   vercel --prod"
    echo ""
fi

# Try to deploy if token exists
if [ ! -z "$VERCEL_TOKEN" ]; then
    echo "🔑 وجدت VERCEL_TOKEN"
    cd ~/Desktop
    vercel --prod --token=$VERCEL_TOKEN
else
    echo "❌ يحتاج إلى تسجيل دخول تفاعلي"
    echo ""
    echo "✅ لكن المشروع على GitHub جاهز للربط!"
    echo "🔗 https://github.com/t009426-byte/lawtest"
fi
