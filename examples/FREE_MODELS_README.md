# Free Models Setup for CAI

This directory contains helper scripts and examples for setting up CAI with **free model options**.

## Quick Setup Script

The `free_models_setup.sh` script provides an interactive way to configure CAI with free models:

### Usage

```bash
# Configure with Groq (free cloud API)
./examples/free_models_setup.sh groq

# Configure with Ollama (local free models)
./examples/free_models_setup.sh ollama

# Show help
./examples/free_models_setup.sh help
```

### What it does

The script will:
1. Guide you through obtaining/configuring API keys
2. Check for required dependencies (for Ollama)
3. Create a properly configured `.env` file
4. Provide model recommendations for security tasks
5. Offer to download models (for Ollama)

## Manual Setup

If you prefer to configure manually, see the comprehensive [Free Models Guide](../docs/free_models_guide.md).

### Groq Setup (Quick)

```bash
# Get API key from https://console.groq.com/
export GROQ_API_KEY="gsk-your-key-here"
export CAI_MODEL="groq/llama-3.3-70b-versatile"
cai
```

### Ollama Setup (Quick)

```bash
# Install Ollama: https://ollama.com/download
ollama pull qwen2.5:14b
export CAI_MODEL="ollama/qwen2.5:14b"
export OLLAMA_API_BASE="http://localhost:11434/v1"
cai
```

## Why Free Models?

Free models provide:
- **No API costs** - Perfect for learning and experimentation
- **Privacy** - Local models keep all data on your machine
- **Accessibility** - Anyone can start using CAI immediately
- **Good performance** - Modern open models are quite capable

## Model Recommendations for Security Tasks

| Task | Groq | Ollama |
|------|------|--------|
| **CTF Challenges** | llama-3.3-70b-versatile | qwen2.5:72b |
| **Reconnaissance** | mixtral-8x7b-32768 | qwen2.5:14b |
| **Code Analysis** | llama-3.1-70b-versatile | deepseek-coder:33b |
| **Budget Testing** | llama-3.1-8b-instant | phi3.5:latest |

## Documentation

For detailed setup instructions, model comparisons, and troubleshooting:

📖 **[Complete Free Models Guide](../docs/free_models_guide.md)**

## Upgrading to CAI PRO

While free models are great for learning and testing, CAI PRO with the `alias1` model offers:
- ✅ Purpose-built for cybersecurity (not general-purpose)
- ✅ Zero refusals for authorized security testing
- ✅ Unlimited tokens with no rate limits
- ✅ Superior CTF and bug bounty performance

Learn more: [CAI PRO Documentation](../docs/cai_pro.md)

## Support

- **Discord**: [Join our community](https://discord.gg/fnUFcTaQAC)
- **Documentation**: [docs/free_models_guide.md](../docs/free_models_guide.md)
- **Issues**: [GitHub Issues](https://github.com/aliasrobotics/cai/issues)
