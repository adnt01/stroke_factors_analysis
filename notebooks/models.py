import numpy as np
import matplotlib.pyplot as plt
import shap

def plot_shap_by_confusion_groups(
    model,
    shap_values,
    y_true,
    y_pred,
    class_index=1,
    max_display=10,
    sample_waterfall=True,
    ):
    """
    Plots beeswarm, bar, and waterfall SHAP plots for TP, TN, FP, FN.

    Parameters
    ----------
    model : fitted model
    X_transformed : model-ready feature matrix
    y_true : true labels
    threshold : probability threshold for positive class
    class_index : class index for SHAP (usually 1)
    max_display : number of features to display
    sample_waterfall : whether to plot a sample waterfall per group
    """
    model_name = model.__class__.__name__

    # Confusion groups
    tp_idx = np.where((y_true == 1) & (y_pred == 1))[0]
    tn_idx = np.where((y_true == 0) & (y_pred == 0))[0]
    fp_idx = np.where((y_true == 0) & (y_pred == 1))[0]
    fn_idx = np.where((y_true == 1) & (y_pred == 0))[0]

    groups = {
        "TP": tp_idx,
        "TN": tn_idx,
        "FP": fp_idx,
        "FN": fn_idx,
    }

    print("\nGroup sizes:")
    for k, v in groups.items():
        print(f"{k}: {len(v)}")

    # SHAP computation (once)
    # explainer = shap.TreeExplainer(model)
    # shap_values = explainer(X_transformed)

    # Handle multiclass/binary edge case
    if len(shap_values.values.shape) == 3:
        shap_values = shap_values[:, :, class_index]

    for name, idx in groups.items():
        print(f"\n===== {name} =====")

        if len(idx) == 0:
            print(f"{name}: no samples — skipping")
            continue

        shap_subset = shap_values[idx]

        # Beeswarm (needs >1 row)
        if shap_subset.values.shape[0] > 1:
            plt.figure()
            shap.plots.beeswarm(shap_subset, max_display=max_display, show=False)
            plt.title(f"{model_name} — {name} — Beeswarm")
            plt.savefig(f"images/{model_name}_Beeswarm_{name}.png", bbox_inches="tight")
            plt.show()
        else:
            print(f"{name}: only one sample — beeswarm skipped")

        # Bar plot (works with >=1)
        plt.figure()
        shap.plots.bar(shap_subset, max_display=max_display, show=False)
        plt.title(f"{model_name} — {name} — Bar")
        plt.savefig(f"images/{model_name}_Bar_{name}.png", bbox_inches="tight")
        plt.show()

        # Waterfall (single example)
        if sample_waterfall:
            i = idx[0]
            single_expl = shap_values[i]
            plt.figure()
            shap.plots.waterfall(single_expl, max_display=max_display, show=False)
            plt.title(f"{model_name} — {name} — Waterfall example")
            plt.savefig(f"images/{model_name}_Waterfall_{name}.png", bbox_inches="tight")
            plt.show()
