(: annotate...  :)
(: unfinished :)
for $endings in ("ax", "ns", "ex", "ix", "ox", "os", "rs")
for $e in //entry
where $e/partOfSpeech[not(*)] and $e/forms/mainform[ends-with(.,$endings)]
return insert node element adjective {} into $e/partOfSpeech