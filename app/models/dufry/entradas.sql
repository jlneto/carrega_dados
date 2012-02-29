select
CONCAT_WS('-','E', NATUREZAOPERACAO, replace(i.CFOP,'.',''), SIGLAUFDESTREM, 'RJ', replace(i.CLASSIFICACAOFISCAL,'.','')) as 'codigo'
, replace(i.CLASSIFICACAOFISCAL,'.','') as 'NCM(ip)'
, NATUREZAOPERACAO as 'NaturezaOperacao(d)'
, replace(i.CFOP,'.','') as 'CdCfop(i)'
, 'RJ' as 'Uf(pd)'
, SIGLAUFDESTREM as 'Uf(pe)'
, 'S' as 'PessoaJuridica(pe)'
, d.NumeroNF as 'Numero(d)'
, d.serienf as 'Serie(d)'
, 'FT' as 'TpDocFiscal(d)'
, 'E'as 'CdTipo(d)'
, i.numerolinha as 'CdItemDocFiscal(i)'
, i.codigobrasif as 'Codigo(ip)'
, i.Quantidade as 'QtItemDocFiscal(i)'
, i.ValorUnitario as 'VlUnitario(i)'
, i.ValorTotalLinha as 'VlTotal(i)'
, coalesce(i.BaseCalculoICMSLinha,0) as 'VlBase(ICMS)'
, coalesce(i.AliquotaICMS,0) as 'VlAliquota(ICMS)'
, coalesce(i.ValorICMS,0) as 'VlImposto(ICMS)'
, coalesce(i.BaseCalculoSubstituicaoLinha,0) as 'VlBase(ST)'
, coalesce(i.ValorICMSSubstituicaoLinha,0) as 'VlImposto(ST)'
, coalesce(i.AliquotaPIS,0) as 'VlAliquota(PIS)'
, coalesce(i.ValorPIS,0) as 'VlImposto(PIS)'
, coalesce(i.AliquotaCOFINS,0) as 'VlAliquota(COFINS)'
, coalesce(i.ValorCOFINS,0) as 'VlImposto(COFINS)'
from dofit001_taxweb_e d, ldfit001_taxweb_e i
where d.CGCEMITENTE = i.CGCEMITENTE
and d.NUMERONF = i.NUMERONF
and i.NumeroLinha = 1
and replace(i.CLASSIFICACAOFISCAL,'.','') not in ('00000000','99999999')
and SIGLAUFDESTREM is not null
group by replace(i.CLASSIFICACAOFISCAL,'.','')
, NATUREZAOPERACAO
, replace(i.CFOP,'.','')
, SIGLAUFDESTREM

