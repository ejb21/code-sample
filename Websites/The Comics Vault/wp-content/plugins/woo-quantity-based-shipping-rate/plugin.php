<?php
/*
Plugin Name: Woo Quantity Based Shipping Rate
Plugin URI: https://wordpress.org/plugins/woo-quantity-based-shipping-rate
Description: Shipping plugin to set shipping rate based on the total order quantity
Version: 1.0.0
Author: Prashanthi

*/

/**
 * Check if WooCommerce is active
 */
if (in_array('woocommerce/woocommerce.php', apply_filters('active_plugins', get_option('active_plugins')))) {

    function wqbsr_init()
    {
        if (!class_exists('WC_WQBSR_Method')) {
            class WC_WQBSR_Method extends WC_Shipping_Method
            {
                /**
                 * Constructor for your shipping class
                 *
                 * @access public
                 */
                public function __construct()
                {
                    $this->id = 'shipping_rate_method'; // Id for your shipping method. Should be unique.
                    $this->method_title = 'Quantity Based Per Order Shipping Rate';  // Title shown in admin
                    $this->method_description = 'Allows you to set shipping rate based on the total order quantity'; // Description shown in admin

                    $this->enabled = "yes"; // This can be added as an setting but for this example its forced enabled
                    $this->title = "Shipping Rate"; // This can be added as an setting but for this example its forced.

                    $this->shipping_rate_option = $this->id . '_shipping_rates';
                    $this->last_shipping_rate_id_option = $this->id . '_last_shipping_rate_id';

                    $this->init();
                    $this->get_rates();
                    $this->get_last_rate_id();
                }

                /**
                 * Init your settings
                 *
                 * @access public
                 * @return void
                 */
                function init()
                {
                    // Load the settings API
                    $this->init_form_fields(); // This is part of the settings API. Override the method to add your own settings
                    $this->init_settings(); // This is part of the settings API. Loads settings you previously init.

                    // Save settings in admin if you have any defined
                    add_action('woocommerce_update_options_shipping_' . $this->id, array($this, 'process_admin_options'));
                    add_action('woocommerce_update_options_shipping_' . $this->id, array($this, 'process_rates'));
                }

                /* The form */
                function init_form_fields()
                {
                    $fields = array(
                        'enabled' => array(
                            'title' => 'Enable/Disable',
                            'type' => 'checkbox',
                            'label' => 'Enable this shipping method',
                            'default' => 'no',
                            'desc_tip' => true
                        ),
                        'shipping_rates_table' => array(
                            'type' => 'shipping_rates_table'
                        ),
                        'new_table'=>array(
                            'type'=>'new_table'
                        ),

                    );
                    $this->form_fields = $fields;
                }

                /**
                 * Generates HTML for top of settings page.
                 */
                function admin_options()
                {
                    ?>

                    <style>

                        table.shippingrows tr th {
                            padding-left: 10px;
                        }

                        a.selected {
                            background-color:#1F75CC;
                            color:white;
                            z-index:100;
                        }

                        .messagepop {
                            background-color:#FFFFFF;
                            border:1px solid #999999;
                            cursor:default;
                            display:none;
                            margin-top: 15px;
                            position:absolute;
                            text-align:left;
                            width:394px;
                            z-index:50;
                            padding: 25px 25px 20px;
                        }

                        label {
                            display: block;
                            margin-bottom: 3px;
                            padding-left: 15px;
                            text-indent: -15px;
                        }

                        .messagepop p, .messagepop.div {
                            border-bottom: 1px solid #EFEFEF;
                            margin: 8px 0;
                            padding-bottom: 8px;
                        }

                    </style>

                    <table class="form-table">
                        <?php $this->generate_settings_html(); ?>
                    </table>

                    <?php
                }

                /**
                 * Generates HTML for table_rate settings table.
                 */
                function generate_new_table_html()
                {
                    ob_start();
                    ?>

                     

                    <?php
                    return ob_get_clean();
                }

                /**
                 * Generates HTML for table_rate settings table.
                 */
                function generate_shipping_rates_table_html()
                {
                    ob_start();
                    ?>
                    <tr valign="top">
                        <th scope="row" class="titledesc"><?php _e('Set', 'wqbsr'); ?></th>
                        <td class="forminp" id="<?php echo $this->id; ?>_table_rates">
                            <table class="shippingrows widefat" cellspacing="0">
                                <thead>
                                <tr>
                                    <th class="check-column"><input type="checkbox"></th>
                                    <th class="debug-col"><?php _e('ID', 'wqbsr'); ?></th>
                                    <th><?php _e('Name', 'wqbsr'); ?> <a class="tips"
                                                                               data-tip="<?php _e('Name of the shipping method.', 'wqbsr'); ?>">[?]</a>
                                    </th>
                                    <th><?php _e('Minimum Quantity', 'wqbsr'); ?> <a class="tips"
                                                                              data-tip="<?php _e('Minimum, in integer format. Inclusive.', 'wqbsr'); ?>">[?]</a>
                                    </th>
                                    <th><?php _e('Maximum Quantity', 'wqbsr'); ?> <a class="tips"
                                                                              data-tip="<?php _e('Maximum, in integer format. Inclusive. ".', 'wqbsr'); ?>">[?]</a>
                                    </th>
                                    <th><?php _e('Rate', 'wqbsr'); ?> <a class="tips"
                                                                               data-tip="<?php _e('Shipping rate ', 'wqbsr'); ?>">[?]</a>
                                    </th>

                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th colspan="7"><a href="#"
                                                       class="add button"><?php _e('Add Shipping Rate', 'wqbsr'); ?></a>
                                        <a href="#"
                                           class="remove button"><?php _e('Delete Shipping Rates', 'wqbsr'); ?></a>
                                    </th>
                                </tr>
                                </tfoot>
                                <tbody class="table_rates">

                                </tbody>
                            </table>
                            <script type="text/javascript">

                                var lastTableRateId = <?php echo $this->last_table_rate_id; ?>;

                                <?php
                                foreach ($this->table_rates as $table_rate):
                                    $js_array = json_encode($table_rate);
                                    echo "jQuery(addTableRateRowHtml(false, {$js_array})).appendTo('#{$this->id}_table_rates table tbody');\n";
                                endforeach;
                                ?>

                                function addTableRateRowHtml(isNew, rowArr) {

                                    if (isNew) {
                                        lastTableRateId++;
                                        rowArr = {};
                                        rowArr['id'] = lastTableRateId;
                                        rowArr['name'] = '';
                                        rowArr['min'] = '';
                                        rowArr['max'] = '';
                                        rowArr['cost'] = '';
                                        rowArr['enabled'] = '1';
                                    }

                                    var size = jQuery('#<?php echo $this->id; ?>_table_rates tbody .table_rate').size();
                                    var html = '\
						   					<tr class="table_rate">\
						   						<input type="hidden" name="<?php echo $this->id; ?>_table_rate_id[' + size + ']" value="' + rowArr['id'] + '" />\
						   						<input type="hidden" name="<?php echo $this->id; ?>_table_rate_enabled[' + size + ']" value="' + rowArr['enabled'] + '" />\
												<th class="check-column"><input type="checkbox" name="select" /></th>\
												<td class="debug-col">\
													' + rowArr['id'] + '\
												</td>\
												<td>\
													<input type="text" name="<?php echo $this->id; ?>_table_rate_name[' + size + ']" value="' + rowArr['name'] + '" placeholder="" size="20" />\
												</td>\
												<td>\
													<input type="number" min="1" name="<?php echo $this->id; ?>_table_rate_min[' + size + ']" value="' + rowArr['min'] + '" placeholder="0" size="4" />\
												</td>\
												<td>\
													<input type="number" min="1" name="<?php echo $this->id; ?>_table_rate_max[' + size + ']" value="' + rowArr['max'] + '" placeholder="0" size="4" />\
												</td>\
												<td>\
													<input type="text" name="<?php echo $this->id; ?>_table_rate_cost[' + size + ']" value="' + rowArr['cost'] + '" placeholder="<?php echo wc_format_localized_price(0); ?>" size="4" class="wc_input_price" />\
												</td>\
											</tr>';
                                    return html;
                                }

                                jQuery(function () {

                                    jQuery('#<?php echo $this->id; ?>_table_rates').on('click', 'a.add', function () {

                                        jQuery(addTableRateRowHtml(true, false)).appendTo('#<?php echo $this->id; ?>_table_rates table tbody');

                                        return false;
                                    });

                                    // Remove row
                                    jQuery('#<?php echo $this->id; ?>_table_rates').on('click', 'a.remove', function () {
                                        var answer = confirm("<?php _e('Delete the selected rates?', 'wqbsr'); ?>");
                                        if (answer) {
                                            jQuery('#<?php echo $this->id; ?>_table_rates table tbody tr th.check-column input:checked').each(function (i, el) {
                                                jQuery(el).closest('tr').remove();
                                            });
                                        }
                                        return false;
                                    });

                                });
                            </script>
                        </td>
                    </tr>
                    <?php
                    return ob_get_clean();
                }

                /**
                 * Retrieves table_rates array from database.
                 */
                function get_rates()
                {
                    $this->table_rates = array_filter((array)get_option($this->shipping_rate_option));
                }

                /**
                 * Retrieves last table_rate id from database.
                 */
                function get_last_rate_id()
                {
                    $this->last_table_rate_id = (int)get_option($this->last_shipping_rate_id_option);
                }

                /**
                 * Process and save submitted table_rates.
                 */
                function process_rates()
                {
                    // Save the rates
                    $table_rate_id = array();
                    $table_rate_name = array();
                    $table_rate_min = array();
                    $table_rate_max = array();
                    $table_rate_cost = array();
                    $table_rate_enabled = array();

                    $table_rates = array();

                    if (isset($_POST[$this->id . '_table_rate_id'])) $table_rate_id = array_map('wc_clean', $_POST[$this->id . '_table_rate_id']);
                    if (isset($_POST[$this->id . '_table_rate_name'])) $table_rate_name = array_map('stripslashes', $_POST[$this->id . '_table_rate_name']);
                    if (isset($_POST[$this->id . '_table_rate_min'])) $table_rate_min = array_map('stripslashes', $_POST[$this->id . '_table_rate_min']);
                    if (isset($_POST[$this->id . '_table_rate_max'])) $table_rate_max = array_map('stripslashes', $_POST[$this->id . '_table_rate_max']);
                    if (isset($_POST[$this->id . '_table_rate_cost'])) $table_rate_cost = array_map('stripslashes', $_POST[$this->id . '_table_rate_cost']);
                    if (isset($_POST[$this->id . '_table_rate_enabled'])) $table_rate_enabled = array_map('wc_clean', $_POST[$this->id . '_table_rate_enabled']);

                    // Get max key
                    $values = $table_rate_id;
                    ksort($values);
                    $value = end($values);
                    $key = key($values);

                    for ($i = 0; $i <= $key; $i++) {
                        if (isset($table_rate_id[$i])
                            && isset($table_rate_name[$i])
                            && isset($table_rate_min[$i])
                            && isset($table_rate_max[$i])
                            && isset($table_rate_cost[$i])
                            && isset($table_rate_enabled[$i])
                        ) {

                            $table_rate_cost[$i] = wc_format_decimal($table_rate_cost[$i]);

                            // Add table_rates to array
                            $table_rates[] = array(
                                'id' => $table_rate_id[$i],
                                'name' => $table_rate_name[$i],
                                'min' => $table_rate_min[$i],
                                'max' => $table_rate_max[$i],
                                'cost' => $table_rate_cost[$i],
                                'enabled' => $table_rate_enabled[$i],
                            );
                        }
                    }

                    if ((!empty($table_rate_id[$key]))
                        && ($table_rate_id[$key] > $this->last_table_rate_id)
                        && (is_numeric($table_rate_id[$key]))
                    ) {
                        $highest_table_rate_id = $table_rate_id[$key];
                        update_option($this->last_shipping_rate_id_option, $highest_table_rate_id);
                    }

                    update_option($this->shipping_rate_option, $table_rates);

                    $this->get_rates();

                }

                /**
                 * Returns the cost from the database if method exists else zero
                 * @return int
                 */
                function get_cost()
                {
                    global $woocommerce;
                    $cost = 0;
                    foreach ($this->table_rates as $table_rate) {
                        $order_count = $woocommerce->cart->cart_contents_count;
                        if ($order_count >= $table_rate['min'] && $order_count <= $table_rate['max']) {
                            $cost = $table_rate['cost'];
                            $this->title = $table_rate['name'];
                        }

                    }
                    return $cost;
                }

                /**
                 * calculate_shipping function.
                 *
                 * @access public
                 * @param mixed $package
                 * @return void
                 */
                public function calculate_shipping( $package=array() ) 
                {
                    if ($this->settings['enabled'] == 'yes') {
                        $cost = $this->get_cost($package);
                        if ($cost == 0) {
                            $this->title = 'No shipping rate set';
                        }
                        $rate = array(
                            'id' => $this->id,
                            'label' => $this->title,
                            'cost' => $cost,

                        );
                    }

                    // Register the rate
                    $this->add_rate($rate);


                }
            }
        }
    }

    add_action('woocommerce_shipping_init', 'wqbsr_init');

    function add_wqbsr_method($methods)
    {
        $methods[] = 'WC_WQBSR_Method';
        return $methods;
    }

    add_filter('woocommerce_shipping_methods', 'add_wqbsr_method');
}
