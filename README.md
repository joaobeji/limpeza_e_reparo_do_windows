# 🚀 Windows Clean & Repair Script

Um script automatizado em lote (`.bat`) projetado para otimizar, limpar arquivos residuais e reparar a integridade do sistema operacional Windows de forma rápida e segura.

## 🛠️ O que este script faz?

O script executa uma sequência de 7 etapas essenciais de manutenção do sistema:

1. **Limpeza da pasta Prefetch:** Remove arquivos de inicialização rápida antigos e redundantes.
2. **Limpeza da pasta Recent:** Elimina o histórico de atalhos de arquivos abertos recentemente.
3. **Limpeza da pasta Temp do Sistema:** Apaga arquivos temporários gerados pelo Windows (`C:\Windows\Temp`).
4. **Limpeza da pasta %temp% do Usuário:** Remove arquivos temporários de aplicativos e navegadores do usuário atual.
5. **Cleanmgr (Limpeza de Disco):** Executa a ferramenta oficial do Windows em modo automatizado.
6. **SFC /scannow:** Varre o sistema em busca de arquivos corrompidos ou ausentes e os repara.
7. **DISM (RestoreHealth):** Conecta-se ao Windows Update para corrigir falhas profundas na imagem do sistema operacional.

## 🚀 Como usar

1. Faça o download do arquivo `limpeza_e_reparo.bat` deste repositório.
2. Clique duas vezes para executar o arquivo.
3. O script irá **solicitar privilégios de Administrador** automaticamente (necessário para limpar pastas do sistema e executar o SFC/DISM).
4. Aguarde a finalização do processo (pode demorar alguns minutos devido às verificações do sistema).

> ⚠️ **Nota:** Algumas mensagens de "Acesso negado" podem aparecer durante a limpeza de pastas temporárias. Isso é perfeitamente normal, pois significa que o Windows ou algum programa aberto está utilizando aquele arquivo específico no momento.

## 📄 Licença

Este projeto está sob a licença MIT - sinta-se livre para usar, modificar e distribuir.
