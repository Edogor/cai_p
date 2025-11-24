# Free Model Options for CAI Framework

## Overview

The Cybersecurity AI (CAI) framework supports a variety of **free and open-source models** that can be used for security testing, vulnerability research, and penetration testing tasks. This guide provides comprehensive information on how to use these free alternatives instead of commercial APIs.

> **💡 Important Note**
> While commercial models like `alias1` (CAI PRO) offer superior performance and optimization for cybersecurity tasks, the free models documented here provide accessible alternatives for learning, research, and budget-conscious security work.

---

## Table of Contents

1. [Groq Cloud API (Free Tier)](#groq-cloud-api-free-tier)
2. [Ollama (Local Free Models)](#ollama-local-free-models)
3. [Other Free Options](#other-free-options)
4. [Model Comparison for Security Tasks](#model-comparison-for-security-tasks)
5. [Best Practices](#best-practices)
6. [Troubleshooting](#troubleshooting)

---

## Groq Cloud API (Free Tier)

**Groq** provides extremely fast inference speeds with a generous free tier, making it an excellent choice for security testing workflows that require rapid iteration.

### Why Groq for Security Tasks?

- ✅ **Free tier available** - Generous rate limits for development and testing
- ✅ **Ultra-fast inference** - Hardware-accelerated LPU™ inference engine
- ✅ **Strong open models** - Access to Llama 3.x, Mixtral, and other capable models
- ✅ **Good for reconnaissance** - Fast enumeration and information gathering
- ✅ **Tool calling support** - Compatible with CAI's tool ecosystem

### Recommended Groq Models for Hacking Tasks

| Model | Best For | Context Window | Notes |
|-------|----------|----------------|-------|
| **llama-3.3-70b-versatile** | General security testing, CTFs | 128K | Best overall choice for security work |
| **llama-3.1-70b-versatile** | Complex exploits, code analysis | 128K | Strong reasoning capabilities |
| **mixtral-8x7b-32768** | Fast reconnaissance, enumeration | 32K | Excellent speed/quality balance |
| **llama-3.1-8b-instant** | Quick tasks, rapid iteration | 128K | Fastest response times |

### Setup Instructions

#### 1. Get Your Groq API Key

1. Visit [Groq Cloud Console](https://console.groq.com/)
2. Sign up for a free account
3. Navigate to **API Keys** section
4. Create a new API key
5. Copy the key (starts with `gsk_...`)

#### 2. Configure CAI with Groq

**Option A: Using Environment Variables**

Create or edit your `.env` file:

```bash
# Required: Keep a placeholder for OpenAI (CAI requirement)
OPENAI_API_KEY="sk-1234"

# Groq configuration
GROQ_API_KEY="gsk-your-actual-key-here"
CAI_MODEL="groq/llama-3.3-70b-versatile"

# Optional: Stream responses for better UX
CAI_STREAM=true

# Optional: Disable prompt toolkit issues
PROMPT_TOOLKIT_NO_CPR=1
```

**Option B: Direct Command Line**

```bash
export GROQ_API_KEY="gsk-your-key-here"
export CAI_MODEL="groq/llama-3.3-70b-versatile"
cai
```

#### 3. Launch CAI

```bash
cai
```

You should see the CAI prompt with Groq configured. You can verify by typing `/model` in the CAI interface.

### Example Usage

Once configured, you can use CAI with Groq for various security tasks:

```bash
CAI> Scan the target at 192.168.1.100 and identify open ports and services
CAI> Analyze this web application for SQL injection vulnerabilities: http://testphp.vulnweb.com
CAI> Help me understand this exploit code and adapt it for my target
```

### Groq Rate Limits (Free Tier)

As of 2024, Groq's free tier typically includes:
- **Requests per minute**: 30 RPM (varies by model)
- **Requests per day**: 14,400 RPD
- **Tokens per minute**: 20,000+ TPM

> **Note**: Rate limits may change. Check [Groq's documentation](https://console.groq.com/docs/rate-limits) for current limits.

### Advanced Groq Configuration

For more control over Groq behavior:

```bash
# Use different models for different tasks
CAI_MODEL="groq/mixtral-8x7b-32768"  # For fast reconnaissance
# or
CAI_MODEL="groq/llama-3.1-70b-versatile"  # For complex analysis

# Adjust model parameters via LiteLLM
GROQ_API_BASE="https://api.groq.com/openai/v1"
```

---

## Ollama (Local Free Models)

**Ollama** allows you to run powerful open-source models locally on your machine, providing complete privacy and no API costs.

### Why Ollama for Security Tasks?

- ✅ **100% Free** - No API costs, unlimited usage
- ✅ **Complete Privacy** - All data stays on your machine
- ✅ **Offline Capable** - Works without internet connection
- ✅ **Custom Fine-tuning** - Ability to train on your own security data
- ✅ **No Rate Limits** - Limited only by your hardware

### Recommended Ollama Models for Hacking Tasks

| Model | Size | RAM Required | Best For | Performance |
|-------|------|--------------|----------|-------------|
| **qwen2.5:72b** | 72B | 48GB+ | Advanced security analysis | ⭐⭐⭐⭐⭐ |
| **qwen2.5:32b** | 32B | 20GB+ | General security testing | ⭐⭐⭐⭐ |
| **llama3.1:70b** | 70B | 48GB+ | Complex exploits, reasoning | ⭐⭐⭐⭐⭐ |
| **codellama:34b** | 34B | 20GB+ | Exploit code analysis | ⭐⭐⭐⭐ |
| **deepseek-coder:33b** | 33B | 20GB+ | Code review, vulnerability detection | ⭐⭐⭐⭐ |
| **qwen2.5:14b** | 14B | 10GB | Budget-friendly option | ⭐⭐⭐ |
| **llama3.1:8b** | 8B | 8GB | Quick tasks, enumeration | ⭐⭐⭐ |
| **phi3.5:latest** | 3.8B | 4GB | Lightweight reconnaissance | ⭐⭐ |

> **💻 Hardware Note**: Larger models provide better reasoning but require more RAM/VRAM. For security work, we recommend at least 16GB RAM and preferably a GPU with 8GB+ VRAM.

### Setup Instructions

#### 1. Install Ollama

**Linux:**
```bash
curl -fsSL https://ollama.com/install.sh | sh
```

**macOS:**
```bash
brew install ollama
```

**Windows:**
Download from [ollama.com/download](https://ollama.com/download)

#### 2. Pull a Security-Optimized Model

```bash
# Recommended: Qwen 2.5 72B (best for security)
ollama pull qwen2.5:72b

# Alternative: Qwen 2.5 14B (more accessible)
ollama pull qwen2.5:14b

# Alternative: Llama 3.1 70B
ollama pull llama3.1:70b

# Code-focused: DeepSeek Coder
ollama pull deepseek-coder:33b
```

#### 3. Start Ollama Server

```bash
# Start Ollama (runs on http://localhost:11434 by default)
ollama serve
```

Or run Ollama in the background:
```bash
# Linux/macOS
nohup ollama serve > /dev/null 2>&1 &

# Or use systemd (if installed via package)
systemctl start ollama
```

#### 4. Configure CAI with Ollama

Create or edit your `.env` file:

```bash
# Required placeholder
OPENAI_API_KEY="sk-1234"

# Ollama configuration
CAI_MODEL="ollama/qwen2.5:72b"
OLLAMA_API_BASE="http://localhost:11434/v1"

# Optional settings
CAI_STREAM=false
PROMPT_TOOLKIT_NO_CPR=1
```

#### 5. Launch CAI

```bash
source cai_env/bin/activate  # If using virtual environment
cai
```

### Verifying Ollama Installation

Before running CAI, verify Ollama is working:

```bash
# Test Ollama directly
ollama list

# Test API endpoint
curl http://localhost:11434/api/tags

# Test generation
ollama run qwen2.5:72b "What is a buffer overflow?"
```

### Example Ollama Workflow

```bash
# Terminal 1: Start Ollama server
ollama serve

# Terminal 2: Run CAI
source cai_env/bin/activate
export CAI_MODEL="ollama/qwen2.5:72b"
export OLLAMA_API_BASE="http://localhost:11434/v1"
cai

# In CAI prompt:
CAI> /model
# Should show: ollama/qwen2.5:72b

CAI> Enumerate subdomains for example.com
```

### Optimizing Ollama Performance

#### GPU Acceleration

Ollama automatically uses GPU if available. Verify with:
```bash
ollama ps
```

#### Model Quantization

Use quantized versions for better performance on limited hardware:

```bash
# Q4_K_M quantization (good balance)
ollama pull qwen2.5:72b-q4_K_M

# Q8 quantization (higher quality, slower)
ollama pull qwen2.5:72b-q8_0

# Configure in CAI
export CAI_MODEL="ollama/qwen2.5:72b-q4_K_M"
```

#### Adjust Context Window

For long conversations, adjust context size in Ollama:

```bash
# Create custom modelfile
cat > Modelfile <<EOF
FROM qwen2.5:72b
PARAMETER num_ctx 8192
PARAMETER temperature 0.7
EOF

# Create custom model
ollama create qwen-security -f Modelfile

# Use in CAI
export CAI_MODEL="ollama/qwen-security"
```

---

## Other Free Options

### 1. Hugging Face Inference API (Free Tier)

Hugging Face offers free inference for many open-source models.

**Setup:**
```bash
export HUGGINGFACE_API_KEY="hf_your_key_here"
export CAI_MODEL="huggingface/codellama/CodeLlama-34b-Instruct-hf"
```

**Best Models:**
- `codellama/CodeLlama-34b-Instruct-hf` - Code analysis
- `mistralai/Mistral-7B-Instruct-v0.2` - General security tasks

### 2. Together AI (Free Credits)

Together AI provides free credits for new users.

**Setup:**
```bash
export TOGETHER_API_KEY="your_key_here"
export CAI_MODEL="together_ai/mistralai/Mixtral-8x7B-Instruct-v0.1"
```

### 3. Anyscale Endpoints (Free Tier)

**Setup:**
```bash
export ANYSCALE_API_KEY="your_key_here"
export CAI_MODEL="anyscale/mistralai/Mixtral-8x7B-Instruct-v0.1"
```

### 4. DeepInfra (Free Tier)

**Setup:**
```bash
export DEEPINFRA_API_KEY="your_key_here"
export CAI_MODEL="deepinfra/meta-llama/Meta-Llama-3.1-70B-Instruct"
```

---

## Model Comparison for Security Tasks

### Performance Matrix

| Model/Provider | Speed | Quality | Privacy | Cost | Recommended For |
|----------------|-------|---------|---------|------|-----------------|
| **Groq (Llama 3.3 70B)** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ | Free | Fast iteration, CTFs |
| **Ollama (Qwen 2.5 72B)** | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | Free | Privacy-critical work |
| **Ollama (Llama 3.1 70B)** | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | Free | Complex analysis |
| **Groq (Mixtral 8x7B)** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | Free | Reconnaissance |
| **Ollama (DeepSeek Coder)** | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | Free | Code vulnerabilities |

### Task-Specific Recommendations

#### Reconnaissance & Enumeration
- **Best Choice:** Groq with Mixtral 8x7B (ultra-fast)
- **Alternative:** Ollama Qwen 2.5:14b (local)

#### Vulnerability Analysis
- **Best Choice:** Groq with Llama 3.3 70B
- **Alternative:** Ollama Qwen 2.5:72b (privacy)

#### Exploit Development
- **Best Choice:** Ollama DeepSeek Coder 33B
- **Alternative:** Groq Llama 3.1 70B

#### CTF Challenges
- **Best Choice:** Groq Llama 3.3 70B (fast reasoning)
- **Alternative:** Ollama Llama 3.1:70b (no limits)

#### Code Review
- **Best Choice:** Ollama DeepSeek Coder 33B
- **Alternative:** Groq Llama 3.1 70B

---

## Best Practices

### 1. Model Selection Strategy

```bash
# For rapid testing and CTFs
export CAI_MODEL="groq/llama-3.3-70b-versatile"

# For sensitive client work (privacy critical)
export CAI_MODEL="ollama/qwen2.5:72b"

# For code-heavy security analysis
export CAI_MODEL="ollama/deepseek-coder:33b"

# For budget-constrained continuous scanning
export CAI_MODEL="ollama/qwen2.5:14b"
```

### 2. Combining Multiple Free Models

Use different models for different CAI agents:

```python
# Example: Multi-agent setup with free models
from cai.sdk.agents import Agent, Runner, OpenAIChatCompletionsModel
from openai import AsyncOpenAI

# Fast enumeration agent using Groq
enum_agent = Agent(
    name="Enumeration Agent",
    instructions="Fast reconnaissance and service enumeration",
    model=OpenAIChatCompletionsModel(
        model="groq/mixtral-8x7b-32768",
        openai_client=AsyncOpenAI(
            api_key=os.getenv('GROQ_API_KEY'),
            base_url="https://api.groq.com/openai/v1"
        )
    )
)

# Deep analysis agent using local Ollama
analysis_agent = Agent(
    name="Analysis Agent",
    instructions="Deep vulnerability analysis and exploit development",
    model=OpenAIChatCompletionsModel(
        model="ollama/qwen2.5:72b",
        openai_client=AsyncOpenAI(
            api_key="ollama",
            base_url="http://localhost:11434/v1"
        )
    )
)
```

### 3. Rate Limit Management

For Groq free tier:

```bash
# Adjust CAI settings to respect rate limits
export CAI_MAX_TURNS=10  # Limit conversation length
export CAI_BRIEF=true    # Reduce token usage
```

### 4. Optimizing for Hardware

If running Ollama on limited hardware:

```bash
# Use smaller quantized models
export CAI_MODEL="ollama/qwen2.5:14b-q4_K_M"

# Or use lightweight models
export CAI_MODEL="ollama/phi3.5:latest"
```

### 5. Fallback Strategy

Configure multiple model options for redundancy:

```bash
# Primary: Groq (fast)
export CAI_MODEL="groq/llama-3.3-70b-versatile"

# Fallback: Local Ollama (if Groq rate limit hit)
export CAI_FALLBACK_MODEL="ollama/qwen2.5:14b"
```

---

## Troubleshooting

### Groq Issues

#### Issue: "API key is invalid"
```bash
# Verify your key
curl -H "Authorization: Bearer $GROQ_API_KEY" https://api.groq.com/openai/v1/models

# Regenerate key at console.groq.com if needed
```

#### Issue: Rate limit exceeded
```bash
# Solution 1: Wait for rate limit reset (typically 1 minute)
# Solution 2: Switch to Ollama
export CAI_MODEL="ollama/qwen2.5:14b"

# Solution 3: Reduce conversation length
export CAI_MAX_TURNS=5
```

#### Issue: Connection timeout
```bash
# Check Groq status
curl https://status.groq.com

# Try different model
export CAI_MODEL="groq/llama-3.1-8b-instant"
```

### Ollama Issues

#### Issue: "Connection refused" to Ollama
```bash
# Start Ollama server
ollama serve

# Verify it's running
curl http://localhost:11434/api/tags

# Check if port is in use
lsof -i :11434
```

#### Issue: Model not found
```bash
# List installed models
ollama list

# Pull the model
ollama pull qwen2.5:72b

# Verify download
ollama list | grep qwen2.5
```

#### Issue: Out of memory
```bash
# Use smaller model
ollama pull qwen2.5:14b
export CAI_MODEL="ollama/qwen2.5:14b"

# Or use quantized version
ollama pull qwen2.5:72b-q4_K_M
export CAI_MODEL="ollama/qwen2.5:72b-q4_K_M"
```

#### Issue: Slow inference
```bash
# Check GPU usage
nvidia-smi  # for NVIDIA
# or
ollama ps

# Use GPU acceleration (should be automatic)
# Verify with:
ollama show qwen2.5:72b --verbose

# Try smaller model for speed
export CAI_MODEL="ollama/qwen2.5:14b"
```

#### Issue: "OLLAMA_API_BASE not found" in CAI
```bash
# Make sure to include /v1 at the end
export OLLAMA_API_BASE="http://localhost:11434/v1"

# Or add to .env
echo 'OLLAMA_API_BASE="http://localhost:11434/v1"' >> .env
```

### General CAI Issues

#### Issue: Model not recognized
```bash
# List available models in CAI
cai
CAI> /model

# Check LiteLLM model format
# Groq: groq/model-name
# Ollama: ollama/model-name
```

#### Issue: High token costs with "free" model
```bash
# Verify you're using free model
CAI> /config

# Should show groq/ or ollama/ prefix
# If showing openai/gpt-4, reconfigure:
export CAI_MODEL="groq/llama-3.3-70b-versatile"
```

---

## Additional Resources

### Official Documentation
- **Groq**: [console.groq.com/docs](https://console.groq.com/docs)
- **Ollama**: [ollama.com/docs](https://ollama.com/library)
- **CAI Framework**: [github.com/aliasrobotics/cai](https://github.com/aliasrobotics/cai)
- **LiteLLM**: [docs.litellm.ai](https://docs.litellm.ai/)

### Community Resources
- **CAI Discord**: [discord.gg/fnUFcTaQAC](https://discord.gg/fnUFcTaQAC)
- **Groq Discord**: [discord.gg/groq](https://discord.gg/groq)
- **Ollama Discord**: [discord.gg/ollama](https://discord.gg/ollama)

### Model Leaderboards
- **CAIBench**: [arxiv.org/pdf/2510.24317](https://arxiv.org/pdf/2510.24317)
- **LiveBench**: [livebench.ai](https://livebench.ai)

### Security Research
- **CAI Research Papers**: [aliasrobotics.com/research-security.php](https://aliasrobotics.com/research-security.php)
- **Cybersecurity AI (2025)**: [arxiv.org/pdf/2504.06017](https://arxiv.org/pdf/2504.06017)

---

## Upgrading to CAI PRO

While free models provide accessible alternatives, **CAI PRO with `alias1`** offers significant advantages for professional security work:

- ✅ **Purpose-built** for cybersecurity (not general-purpose)
- ✅ **Zero refusals** for authorized security testing
- ✅ **Unlimited tokens** (no rate limits or costs per token)
- ✅ **Superior performance** in CTF and bug bounty scenarios
- ✅ **Professional support** and priority updates
- ✅ **European GDPR compliance** and data sovereignty

**Learn more**: [CAI PRO Documentation](cai_pro.md)

---

## Summary

| Scenario | Recommended Free Option | Why |
|----------|------------------------|-----|
| **Learning & CTFs** | Groq Llama 3.3 70B | Fast, free tier, good quality |
| **Professional Testing** | Ollama Qwen 2.5 72B | Privacy, unlimited, no costs |
| **Budget Penetration Testing** | Ollama Qwen 2.5 14B | Balance of performance and resources |
| **Code Analysis** | Ollama DeepSeek Coder 33B | Specialized for code |
| **Fast Enumeration** | Groq Mixtral 8x7B | Ultra-fast inference |
| **Privacy-Critical Work** | Ollama (any model) | 100% local, no data sharing |

**Getting Started Quick Commands:**

```bash
# Groq Setup (fastest to get started)
export GROQ_API_KEY="gsk-your-key"
export CAI_MODEL="groq/llama-3.3-70b-versatile"
cai

# Ollama Setup (best for privacy)
ollama pull qwen2.5:72b
export CAI_MODEL="ollama/qwen2.5:72b"
export OLLAMA_API_BASE="http://localhost:11434/v1"
cai
```

---

**Questions or Issues?** 
- Join our [Discord community](https://discord.gg/fnUFcTaQAC)
- Check the [FAQ](cai_faq.md)
- Open an issue on [GitHub](https://github.com/aliasrobotics/cai/issues)
