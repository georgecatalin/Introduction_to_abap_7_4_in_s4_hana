*&---------------------------------------------------------------------*
*& Report z_adt_alpha
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_alpha.

DATA(lv_article) = '000000123456789'. " Leading zeros will be removed when converting to alpha format

WRITE: / 'Original before conversion:', lv_article.

lv_article = | { lv_article ALPHA = OUT } |. " Convert to alpha format (remove leading zeros)
WRITE: / 'Converted to alpha:', lv_article.

lv_article = | { lv_article ALPHA = IN } |. " Convert back to numeric format
WRITE: / 'Converted back to numeric:', lv_article.
