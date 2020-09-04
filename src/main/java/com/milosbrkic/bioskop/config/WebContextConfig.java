package com.milosbrkic.bioskop.config;

//import fon.silab.njt.spring.mvc.demomvcapplication.service.CountryService;
import com.milosbrkic.bioskop.formatter.DatumFormater;
import com.milosbrkic.bioskop.formatter.DistributerFormater;
import com.milosbrkic.bioskop.formatter.FilmFormater;
import com.milosbrkic.bioskop.formatter.OsobaFormater;
import com.milosbrkic.bioskop.formatter.ProjekcijaFormater;
import com.milosbrkic.bioskop.formatter.SalaFormater;
import com.milosbrkic.bioskop.formatter.VremeFormater;
import com.milosbrkic.bioskop.formatter.ZanrFormater;
import com.milosbrkic.bioskop.formatter.ZaposleniFormater;
import com.milosbrkic.bioskop.repository.DistributerRepository;
import com.milosbrkic.bioskop.repository.FilmRepository;
import com.milosbrkic.bioskop.repository.OsobaRepository;
import com.milosbrkic.bioskop.repository.ProjekcijaRepository;
import com.milosbrkic.bioskop.repository.SalaRepository;
import com.milosbrkic.bioskop.repository.ZanrRepository;
import com.milosbrkic.bioskop.repository.ZaposleniRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.format.FormatterRegistry;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

//konfigurisanje binova u web kontekstu za konkretni dispatcher
@Configuration
@Import({DatabaseConfiguration.class, SecurityConfig.class})
@EnableTransactionManagement
//kreira RequstMappingHandlerMapping koji mapira url ka kontroleru
@EnableWebMvc
@ComponentScan(basePackages = {
    "com.milosbrkic.bioskop.controller",
    "com.milosbrkic.bioskop.repository",
    "com.milosbrkic.bioskop.service",
    "com.milosbrkic.bioskop.validator",
    "com.milosbrkic.bioskop.formatter"
}
)
//za definisanje HanderMappera, kontrolera, viewResolver-a
public class WebContextConfig implements WebMvcConfigurer {

    private final DistributerRepository distributerRepository;
    private final ZanrRepository zanrRepository;
    private final FilmRepository filmRepository;
    private final SalaRepository salaRepository;
    private final ProjekcijaRepository projekcijaRepository;
    private final ZaposleniRepository zaposleniRepository;
    private final OsobaRepository osobaRepository;

    @Autowired
    public WebContextConfig(DistributerRepository distributerRepository, ZanrRepository zanrRepository, FilmRepository filmRepository, SalaRepository salaRepository, ProjekcijaRepository projekcijaRepository, ZaposleniRepository zaposleniRepository, OsobaRepository osobaRepository) {
        this.distributerRepository = distributerRepository;
        this.zanrRepository = zanrRepository;
        this.filmRepository = filmRepository;
        this.salaRepository = salaRepository;
        this.projekcijaRepository = projekcijaRepository;
        this.zaposleniRepository = zaposleniRepository;
        this.osobaRepository = osobaRepository;
    }

    
    @Bean
    public ViewResolver tilesViewResolver() {
        TilesViewResolver tilesViewResolver = new TilesViewResolver();
        tilesViewResolver.setOrder(0);
        return tilesViewResolver;
    }

    @Bean
    public TilesConfigurer tilesConfigurer() {
        TilesConfigurer tilesConfigurer = new TilesConfigurer();
        tilesConfigurer.setDefinitions(new String[]{"/WEB-INF/pages/tiles/tiles.xml"});
        return tilesConfigurer;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/webjars/**").addResourceLocations("/webjars/");
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }

    /*@Bean
    public ViewResolver createViewResolver(){
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/pages/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }*/
    
    @Bean
    public MessageSource messageSource() {
        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
        messageSource.setBasenames("validation/validation","messages/messages");
        messageSource.setFallbackToSystemLocale(false);
        return messageSource;
    }
    
    @Bean
    public LocaleResolver localeResolver() {
        return new CookieLocaleResolver();
        //return new SessionLocaleResolver();
    }
    
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
        localeChangeInterceptor.setParamName("lang");
        registry.addInterceptor(localeChangeInterceptor);
    }

    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addFormatter(new DistributerFormater(distributerRepository));
        registry.addFormatter(new ZanrFormater(zanrRepository));
        registry.addFormatter(new FilmFormater(filmRepository));
        registry.addFormatter(new SalaFormater(salaRepository));
        registry.addFormatter(new ProjekcijaFormater(projekcijaRepository));
        registry.addFormatter(new ZaposleniFormater(zaposleniRepository));
        registry.addFormatter(new OsobaFormater(osobaRepository));
        registry.addFormatter(new DatumFormater());
        registry.addFormatter(new VremeFormater());
    }
    
    
}
