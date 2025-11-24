#!/bin/bash
#
# Free Models Setup Script for CAI Framework
# This script helps you quickly configure CAI with free model options
#
# Usage:
#   ./free_models_setup.sh groq     # Configure for Groq
#   ./free_models_setup.sh ollama   # Configure for Ollama
#

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print colored messages
print_info() {
    echo -e "${BLUE}ℹ ${NC}$1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Function to setup Groq
setup_groq() {
    print_info "Setting up CAI with Groq (Free Tier)"
    echo ""
    
    print_info "Step 1: Get your Groq API key"
    echo "  1. Visit: https://console.groq.com/"
    echo "  2. Sign up for a free account"
    echo "  3. Navigate to 'API Keys' section"
    echo "  4. Create a new API key"
    echo ""
    
    read -p "Enter your Groq API key (starts with gsk_): " GROQ_KEY
    
    if [[ ! $GROQ_KEY =~ ^gsk_ ]]; then
        print_warning "API key should start with 'gsk_'. Continuing anyway..."
    fi
    
    # Create .env configuration
    print_info "Creating .env configuration..."
    
    cat > .env << EOF
# CAI Configuration with Groq (Free Tier)
# Generated on $(date)

# Required placeholder (CAI requirement)
OPENAI_API_KEY="sk-1234"

# Groq API Configuration
GROQ_API_KEY="$GROQ_KEY"
CAI_MODEL="groq/llama-3.3-70b-versatile"

# Optional settings
CAI_STREAM=true
PROMPT_TOOLKIT_NO_CPR=1

# Uncomment to try different Groq models:
# CAI_MODEL="groq/mixtral-8x7b-32768"      # Faster, good for reconnaissance
# CAI_MODEL="groq/llama-3.1-70b-versatile" # Strong reasoning
# CAI_MODEL="groq/llama-3.1-8b-instant"    # Fastest responses
EOF
    
    print_success "Configuration saved to .env"
    echo ""
    print_success "Setup complete! You can now run: cai"
    echo ""
    print_info "Recommended Groq models for security tasks:"
    echo "  • llama-3.3-70b-versatile (current) - Best overall"
    echo "  • mixtral-8x7b-32768 - Fast reconnaissance"
    echo "  • llama-3.1-8b-instant - Rapid iteration"
    echo ""
    print_info "For more details, see: docs/free_models_guide.md"
}

# Function to setup Ollama
setup_ollama() {
    print_info "Setting up CAI with Ollama (Local Free Models)"
    echo ""
    
    # Check if Ollama is installed
    if ! command -v ollama &> /dev/null; then
        print_warning "Ollama is not installed!"
        echo ""
        print_info "To install Ollama:"
        echo "  Linux:   curl -fsSL https://ollama.com/install.sh | sh"
        echo "  macOS:   brew install ollama"
        echo "  Windows: Download from https://ollama.com/download"
        echo ""
        read -p "Do you want to continue anyway? (y/n): " CONTINUE
        if [[ ! $CONTINUE =~ ^[Yy]$ ]]; then
            exit 1
        fi
    else
        print_success "Ollama is installed"
        
        # Check if Ollama is running
        if curl -s http://localhost:11434/api/version &> /dev/null; then
            print_success "Ollama server is running"
        else
            print_warning "Ollama server is not running"
            print_info "Start it with: ollama serve"
        fi
    fi
    
    echo ""
    print_info "Recommended models for security tasks:"
    echo "  1. qwen2.5:72b      - Best overall (requires 48GB RAM)"
    echo "  2. qwen2.5:14b      - Good balance (requires 10GB RAM)"
    echo "  3. llama3.1:70b     - Strong reasoning (requires 48GB RAM)"
    echo "  4. deepseek-coder:33b - Code analysis (requires 20GB RAM)"
    echo ""
    
    read -p "Select model (1-4) or enter custom model name [1]: " MODEL_CHOICE
    MODEL_CHOICE=${MODEL_CHOICE:-1}
    
    case $MODEL_CHOICE in
        1)
            MODEL_NAME="qwen2.5:72b"
            ;;
        2)
            MODEL_NAME="qwen2.5:14b"
            ;;
        3)
            MODEL_NAME="llama3.1:70b"
            ;;
        4)
            MODEL_NAME="deepseek-coder:33b"
            ;;
        *)
            MODEL_NAME="$MODEL_CHOICE"
            ;;
    esac
    
    print_info "Selected model: $MODEL_NAME"
    echo ""
    
    # Check if model is available
    if command -v ollama &> /dev/null; then
        if ollama list | grep -q "$MODEL_NAME"; then
            print_success "Model already downloaded"
        else
            print_warning "Model not found locally"
            read -p "Do you want to download it now? (y/n): " DOWNLOAD
            if [[ $DOWNLOAD =~ ^[Yy]$ ]]; then
                print_info "Downloading $MODEL_NAME (this may take a while)..."
                ollama pull "$MODEL_NAME"
                print_success "Model downloaded"
            fi
        fi
    fi
    
    # Create .env configuration
    print_info "Creating .env configuration..."
    
    cat > .env << EOF
# CAI Configuration with Ollama (Local Free Models)
# Generated on $(date)

# Required placeholder
OPENAI_API_KEY="sk-1234"

# Ollama Configuration
CAI_MODEL="ollama/$MODEL_NAME"
OLLAMA_API_BASE="http://localhost:11434/v1"

# Optional settings
CAI_STREAM=false
PROMPT_TOOLKIT_NO_CPR=1

# Other recommended Ollama models for security:
# CAI_MODEL="ollama/qwen2.5:72b"         # Best overall (48GB RAM)
# CAI_MODEL="ollama/qwen2.5:14b"         # Balanced (10GB RAM)
# CAI_MODEL="ollama/llama3.1:70b"        # Strong reasoning (48GB RAM)
# CAI_MODEL="ollama/deepseek-coder:33b"  # Code analysis (20GB RAM)
EOF
    
    print_success "Configuration saved to .env"
    echo ""
    print_success "Setup complete!"
    echo ""
    print_info "To start using CAI with Ollama:"
    echo "  1. Ensure Ollama is running: ollama serve"
    echo "  2. Run CAI: cai"
    echo ""
    print_info "For more details, see: docs/free_models_guide.md"
}

# Function to show help
show_help() {
    echo "Free Models Setup Script for CAI Framework"
    echo ""
    echo "Usage:"
    echo "  $0 groq     - Configure CAI with Groq (free cloud API)"
    echo "  $0 ollama   - Configure CAI with Ollama (local free models)"
    echo "  $0 help     - Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 groq     # Fast inference, generous free tier"
    echo "  $0 ollama   # Complete privacy, unlimited usage"
    echo ""
    echo "For detailed information, see: docs/free_models_guide.md"
}

# Main script logic
case "${1:-help}" in
    groq)
        setup_groq
        ;;
    ollama)
        setup_ollama
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        print_error "Unknown option: $1"
        echo ""
        show_help
        exit 1
        ;;
esac
