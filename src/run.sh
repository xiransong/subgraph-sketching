# python runners/run.py --dataset Citeseer --model ELPH
# python runners/run.py --dataset Citeseer --model BUDDY
# python runners/run.py --dataset Pubmed --max_hash_hops 3 --feature_dropout 0.2 --model ELPH
# python runners/run.py --dataset Pubmed --max_hash_hops 3 --feature_dropout 0.2 --model BUDDY
# python runners/run.py --dataset ogbl-collab --K 50 --feature_dropout 0.05 --label_dropout 0.1 --year 2007 --model ELPH --hll_p 8
# python runners/run.py --dataset ogbl-collab --K 50 --feature_dropout 0.05 --label_dropout 0.1 --year 2007 --model BUDDY
python runners/run.py --dataset ogbl-ppa --label_dropout 0.1 --use_feature 0 --use_RA 1 --lr 0.03 --epochs 100 --hidden_channels 256 --cache_subgraph_features --add_normed_features 1 --model BUDDY
# python runners/run.py --dataset ogbl-ddi --K 20 --train_node_embedding --propagate_embeddings --epochs 150 --hidden_channels 256 --lr 0.0015 --num_negs 6 --use_feature 0 --sign_k 2 --batch_size 131072 --model ELPH
# python runners/run.py --dataset ogbl-ddi --K 20 --train_node_embedding --propagate_embeddings --epochs 150 --hidden_channels 256 --lr 0.0015 --num_negs 6 --use_feature 0 --sign_k 2 --batch_size 131072 --model BUDDY
# python runners/run.py --dataset ogbl-citation2 --hidden_channels 128 --num_negs 5 --sign_dropout 0.2 --sign_k 3 --cache_subgraph_features --model BUDDY
