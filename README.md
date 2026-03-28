# 和 AI 好好说话：零基础提示工程指南

这是一本完全开源的提示工程（Prompt Engineering）小册子，专为希望将大语言模型（LLM）彻底融入办公与生活流的零基础读者编写。

## 🛠️ 本地编译 PDF (How to Compile)

本指南全程使用 `LaTeX` 开发并进行精美排版，你需要一个基础的 TeX 编译环境（如 TeX Live / MacTeX）：

推荐使用 `make` 工具一键编译（内置了 `pdflatex` 与 `xelatex` 指令支持）：

```bash
# 执行完整编译流程
make

# 清理构建生成的临时缓存文件
make clean
```

生成的 PDF 将保存在项目根目录的 `prompt-engineering-guide-for-beginners.pdf` 中。

## 📜 许可证 (License)

本项目开源并遵循 [Apache-2.0 License](LICENSE)。你可以自由分发、演绎或作为内训教材，如果它帮助到了你，请不要吝啬右上角的 Star。🌟
