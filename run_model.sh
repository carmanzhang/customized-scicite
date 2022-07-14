#Download one of the pre-trained models and run the following command:
#[path-to-data.jsonl] contains the data in the same format as the training data.
#[path-to-model.tar.gz] is the path to the pretrained model
#[predictor-type] is one of predictor_scicite (for the SciCite dataset format) or predictor_aclarc (for the ACL-ARC dataset format).
#--output-file [out-path.jsonl] is an optional argument showing the path to the output. If you don't pass this, the output will be printed in the stdout.
#If you are using your own data, you need to first convert your data to be according to the SciCite data format.
#
#allennlp predict [path-to-model.tar.gz] [path-to-data.jsonl] \
#--predictor [predictor-type] \
#--include-package scicite \
#--overrides "{'model':{'data_format':''}}"

#allennlp predict /home/zhangli/pre-trained-models/scicite.tar.gz /home/zhangli/github_repo/scicite/data/scicite/test.jsonl \
#--predictor predictor_scicite \
#--include-package scicite \
#--overrides "{'model':{'data_format':''}}" \
#--cuda-device 0 # specific a GPU

# Note using predictor_scicite model
allennlp predict /home/zhangli/pre-trained-models/scicite.tar.gz /home/zhangli/mydisk-2t/repo/scholarly-bigdata/src/analysis-for-pmc-citation-intent/convert-pmc-cc-to-scicite-format/pmc-citation-context.jsonl \
--predictor predictor_scicite \
--include-package scicite \
--overrides "{'model':{'data_format':'', 'predict_mode': true}}" \
--output-file 'pmc-citation-context-scicite-predictions.txt' \
--cuda-device 0 # specific a GPU

# Note using predictor_aclarc model
allennlp predict /home/zhangli/pre-trained-models/aclarc.tar.gz /home/zhangli/mydisk-2t/repo/scholarly-bigdata/src/analysis-for-pmc-citation-intent/convert-pmc-cc-to-scicite-format/pmc-citation-context.jsonl \
--predictor predictor_aclarc \
--include-package scicite \
--overrides "{'model':{'data_format':'', 'predict_mode': true}}" \
--output-file 'pmc-citation-context-aclarc-predictions.txt' \
--cuda-device 0 # specific a GPU
