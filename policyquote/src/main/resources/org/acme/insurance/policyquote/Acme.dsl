[condition][]There is a Driver=driver : Driver()
[condition][]- age less than {age} years old=age < {age}
[condition][]- age greater than {age} years old=age > {age}
[condition][]- has had more than {number} number of accidents=numberOfAccidents > {number}
[condition][]- age is at least {age}=age >= {age}
[condition][]- age is between {lower} and {upper} years old=age >= {lower}, age <= {upper}
[condition][]- has had exactly {number} number of accidents=numberOfAccidents == {number}
[condition][]- has more than {number} number of tickets=numberOfTickets > {number}
[condition][]- has less than or equal to {number} number of tickets=numberOfTickets <= {number}
[condition][]There is a Policy=policy : Policy()
[condition][]- policy has a driver {driver}=driver == driver
[condition][]- policy type is '{type}'=policyType ==  "{type}"
[condition][]- vehicle year is greater than {year}=vehicleYear > {year}
[condition][]- price is greater than {amount}=price > {amount}
[condition][]- price is equal to {amount}=price == {amount}
[consequence][]Reject Policy with explanation : '{reason}'=insert(new Rejection("{reason}"));
[condition][]Policy has not been rejected=not Rejection()
[consequence][]logRule=System.out.println("the rule that executed is: " + drools.getRule());
[consequence][]Add surcharge {surcharge} to Policy=modify(policy) \{price = policy.price + {surcharge}\}
[condition][]Sum all policies for the same driver=Number( total : intValue > 0) from accumulate( Policy( policyType != "MASTER",     priceVar : price > 0, driver == driver), sum( priceVar ) )
[consequence][]Set policy total=modify (policy) {setPrice(total)}